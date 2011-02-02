module Palmade
  module OcrWebServiceClient

    class OCRWSZone
      attr_accessor :top, :left, :height, :width, :zone_type

      def initialize(top, left, height, width, zone_type)
        @top       = top
        @left      = left
        @height    = height
        @width     = width
        @zone_type = zone_type
      end

      def to_xml(builder)
        builder.Top @top
        builder.Left @left
        builder.Height @height
        builder.Width @width
        builder.ZoneType @zone_type
      end
    end

  end

end
