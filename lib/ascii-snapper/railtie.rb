module AsciiSnapper
  class Railtie < Rails::Railtie
    initializer "ascii-snapper.insert_middleware" do |app|
      app.config.middleware.insert_before 0, "AsciiSnapper::Middleware"
    end
  end
end