module Palmade
  module OcrWebServiceClient

    class OCRWebServiceAvailablePages
      attr_accessor :user_name, :license_code

      def initialize(user_name, license_code)
        @user_name         = user_name
        @license_code      = license_code
      end

      def to_xml
        builder = Builder::XmlMarkup.new({ :indent => 2})
        builder.instruct! :xml
        builder.tag! "soap:Envelope", "xmlns:xsd" => "http://www.w3.org/2001/XMLSchema", "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "xmlns:soap" => "http://schemas.xmlsoap.org/soap/envelope/" do
          builder.tag! "soap:Body" do
            builder.tag! "OCRWebServiceAvailablePages", "xmlns" => "http://stockservice.contoso.com/wse/samples/2005/10" do
              builder.user_name @user_name
              builder.license_code @license_code
            end
          end
        end
      end
    end

  end
end
