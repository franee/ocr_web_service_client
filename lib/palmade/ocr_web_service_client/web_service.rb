module Palmade
  module OcrWebServiceClient
    class WebService
      include Singleton

      def initialize
        @config  = OcrWebServiceClient.config
        @uri     = URI.parse(@config.ocr_web_service_url)
      end

      def post(data)
        http         = new_http
        request      = new_request
        request.body = data
        body         = nil

        SystemTimer.timeout(@config.timeout) do
          response = http.request(request)
          body     = response.body
        end

        body
      end

      protected

      def new_http
        http = ::Net::HTTP.new(@uri.host, @uri.port)
        http.set_debug_output(STDOUT) if $DEBUG
        http
      end

      def new_request
        request  = ::Net::HTTP::Post.new(@uri.path)
        request["Content-Type"] = "text/xml; charset=UTF-8"
        request["SOAPAction"]   = @config.soap_action
        request
      end
    end
  end
end
