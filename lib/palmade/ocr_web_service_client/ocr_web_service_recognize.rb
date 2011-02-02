module Palmade
  module OcrWebServiceClient

    class OCRWebServiceRecognize
      attr_accessor :user_name, :license_code, :ocrws_input_image, :ocrws_setting

      def initialize(user_name, license_code, ocrws_input_image, ocrws_setting)
        @user_name         = user_name
        @license_code      = license_code
        @ocrws_input_image = ocrws_input_image
        @ocrws_setting     = ocrws_setting
      end

      def to_xml
        builder = Builder::XmlMarkup.new({ :indent => 2})
        builder.instruct! :xml
        builder.tag! "soap:Envelope", "xmlns:xsd" => "http://www.w3.org/2001/XMLSchema", "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "xmlns:soap" => "http://schemas.xmlsoap.org/soap/envelope/" do
          builder.tag! "soap:Body" do
            builder.tag! "OCRWebServiceRecognize", "xmlns" => "http://stockservice.contoso.com/wse/samples/2005/10" do
              builder.user_name @user_name
              builder.license_code @license_code
              builder.OCRWSInputImage {
                @ocrws_input_image.to_xml(builder)
              }
              builder.OCRWSSetting {
                @ocrws_setting.to_xml(builder)
              }
            end
          end
        end
      end
    end

  end
end
