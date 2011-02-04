module Palmade
  module OcrWebServiceClient

    class OCRWSInputImage
      attr_accessor :file_name, :file_data

      def initialize(target)
        @file_name = File.basename(target)
        @file_data = Base64.encode64(IO.read(target))
      end

      def to_xml(builder)
        builder.fileName @file_name
        builder.fileData @file_data
      end
    end

  end
end
