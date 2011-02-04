module Palmade
  module OcrWebServiceClient

    class Runner
      include Singleton

      def initialize
        @config = OcrWebServiceClient.config
        @ws     = WebService.instance
        @logger = OcrWebServiceClient.logger
      end

      def ocr_web_service_recognize(target)
        begin
          ocr_ws_recognize_obj = get_ocr_web_service_recognize(target)
          xml = ocr_ws_recognize_obj.to_xml

          reply = @ws.post(xml)

          ocr_text = clean_str(parse_ocr_web_service_recognize_response(reply))
          say ocr_text
        rescue Exception
          ocr_text = ''
        end

        ocr_text
      end

      protected

      def say(msg)
        @logger.info msg
      end

      def get_ocr_web_service_recognize(target)
        user_name         = @config.user_name
        license_code      = @config.license_code
        ocrws_input_image = get_ocrws_input_image(target)
        ocrws_setting     = get_ocrws_setting

        OCRWebServiceRecognize.new(user_name, license_code, ocrws_input_image, ocrws_setting)
      end

      def get_ocrws_input_image(target)
        OCRWSInputImage.new(target)
      end

      def get_ocrws_setting
        ocr_languages          = ['DUTCH']
        output_document_format = 'TXT'
        convert_to_bw          = false
        get_ocr_text           = false
        create_output_document = true
        multi_page_doc         = false
        page_numbers           = ''
        ocr_zones              = []
        ocr_words              = false

        OCRWSSetting.new(ocr_languages, output_document_format, convert_to_bw, get_ocr_text,
                         create_output_document, multi_page_doc, page_numbers, ocr_zones, ocr_words)
      end

      def parse_ocr_web_service_recognize_response(reply)
        doc   = get_parsed_doc(reply)
        nodes =  doc.find('//ns:OCRWebServiceRecognizeResponse/ns:OCRWSResponse/ns:fileData',
                          'ns' => 'http://stockservice.contoso.com/wse/samples/2005/10')

        result = Base64.decode64(nodes.first.content)

        nodes = nil # garbage collect
        result
      end

      def get_parsed_doc(reply)
        parser = XML::Parser.string(reply, :encoding => XML::Encoding::UTF_8)
        parser.parse
      end

      def clean_str(str)
        str.bytes.to_a.delete_if { |x| x == 0 }.pack("c*")
      end

    end

  end
end

