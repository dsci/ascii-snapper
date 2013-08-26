module AsciiSnapper
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(convert_params(env))
    end

    private

    # Public: Encodes POST params to UTF-8 unless the POST data isnt
    # already UTF-8 encoded.
    #
    # env - Rack environment.
    #
    # Returns the Rack env with encoded post data.
    def convert_params(env)
      if defined?(Rails)
        request_klass = ActionDispatch::Request
      else
        request_klass = Rack::Request
      end
      request = request_klass.new(env)
      if request.post?
        unless env["CONTENT_TYPE"].include?("multipart/form-data")
          params = env['rack.input'].gets
          if params.encoding.name.eql?("ASCII-8BIT")
            env['rack.input'] = StringIO.new(params.force_encoding("utf-8"))
            env["rack.input"].rewind
          end
        end
      end

      return env
    end
  end
end