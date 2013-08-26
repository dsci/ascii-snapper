# -*- encoding : utf-8 -*-
require 'spec_helper'
CONFIG_RU_PATH = File.expand_path(File.join(
                                  File.dirname(__FILE__),'rack_app',
                                              'config.ru')
                                  )
OUTER_APP = Rack::Builder.parse_file(CONFIG_RU_PATH).first

describe "Ascii-Snapper middleware" do
  include Rack::Test::Methods

  def app
    OUTER_APP
  end

  it "converts ASCII-8BIT post data to utf-8" do
    json = MultiJson.dump({:login => "dscö"})
    post '/', json.force_encoding("ASCII-8BIT")
    expect(last_response.body).to include("Encoding is: UTF-8")
    expect(last_response.body).to include("dscö")

    post '/', MultiJson.dump({:login => "dscö"}).force_encoding("UTF-8")
    expect(last_response.body).to include("Encoding is: UTF-8")
    expect(last_response.body).to include("dscö")
  end

end
