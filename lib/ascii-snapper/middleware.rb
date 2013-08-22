module AsciiSnapper
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      p "ASCII snapper is here!"
      @app.call(env)
    end
  end
end