module Palmade
  module OcrWebServiceClient
    class WebService
      include Singleton

      def initialize
        @config  = OcrWebServiceClient.config
        @uri     = URI.parse(@config.ocr_web_service_url)
        @http    = setup_http
        @request = setup_request
      end

      def post(data)
        @request.body = data
        body          = nil

        Timeout::timeout(@config.timeout) do
          response = @http.request(@request)
          body     = response.body
        end

        body
      end

      protected

      def setup_http
        http = ::Net::HTTP.new(@uri.host, @uri.port)
        http.set_debug_output(STDOUT) if $DEBUG
        http
      end

      def setup_request
        request  = ::Net::HTTP::Post.new(@uri.path)
        request["Content-Type"] = "text/xml; charset=UTF-8"
        request["SOAPAction"]   = @config.soap_action
        request
      end
    end
  end
end
