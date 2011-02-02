module Palmade
  module OcrWebServiceClient

    class OCRWSInputImage
      attr_accessor :file_name, :file_data

      def initialize(file_name, file_data)
        @file_name = file_name
        @file_data = Base64.encode64(file_data)
      end

      def to_xml(builder)
        builder.fileName @file_name
        builder.fileData @file_data
      end
    end

  end
end
