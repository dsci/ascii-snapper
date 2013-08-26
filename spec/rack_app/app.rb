class App

  def call(env)
    params = env['rack.input'].gets
    response  = Rack::Response.new
    response['Content-Type'] = 'text/html'
    response.write front_page(params)
    response.finish
  end

  def front_page(params)
    params    = MultiJson.load(params)
    encoding  = params.values.first.encoding.name
    output    = ""
    params.each do |key,value|
      output += "#{key} : #{value}"
    end
    %Q{
      <html>
        <head>
          <title></title>
        </head>
        <body>
          #{output}
          Encoding is: #{encoding}
        </body>
      </html>
    }
  end

end