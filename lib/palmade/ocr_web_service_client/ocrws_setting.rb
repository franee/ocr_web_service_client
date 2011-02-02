module Palmade
  module OcrWebServiceClient

    class OCRWSSetting
      attr_accessor :ocr_languages, :output_document_format, :convert_to_bw
      attr_accessor :get_ocr_text, :create_output_document, :multi_page_doc, :page_numbers, :ocr_zones, :ocr_words

      def initialize(ocr_languages, output_document_format, convert_to_bw, get_ocr_text, create_output_document, multi_page_doc, page_numbers, ocr_zones, ocr_words)
        @ocr_languages          = ocr_languages
        @output_document_format = output_document_format
        @convert_to_bw          = convert_to_bw
        @get_ocr_text           = get_ocr_text
        @create_output_document = create_output_document
        @multi_page_doc         = multi_page_doc
        @page_numbers           = page_numbers
        @ocr_zones              = ocr_zones
        @ocr_words              = ocr_words
      end

      def to_xml(builder)
        @ocr_languages.each do |lang|
          builder.ocrLanguages lang
        end
        builder.outputDocumentFormat @output_document_format
        builder.convertToBW @convert_to_bw
        builder.getOCRText @get_ocr_text
        builder.createOutputDocument @create_output_document
        builder.multiPageDoc @multi_page_doc
        builder.pageNumbers @page_numbers
        builder.ocrZones {
          @ocr_zones.each do |zone|
            zone.OCRWSZone {
              zone.to_xml(builder)
            }
          end
        }
        builder.ocrWords @ocr_words
      end
    end

  end

end
