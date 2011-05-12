module Palmade
  module OcrWebServiceClient
    class WebService
      include Singleton

      def initialize
        @config  = OcrWebServiceClient.config
        @uri     = URI.parse(@config.ocr_web_service_url)
      end

      def post(data, action)
        @soap_action = action
        http         = new_http
        request      = new_request
        request.body = data
        body         = nil

        PalmadeTimer.timeout(@config.timeout) do
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
        request["SOAPAction"]   = "http://stockservice.contoso.com/wse/samples/2005/10/#{@soap_action}"
        request
      end
    end
  end
end
