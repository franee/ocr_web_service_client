require 'rubygems'
require 'net/http'
require 'uri'
require 'singleton'
require 'builder'
require 'logger'
require 'xml'
require 'timeout'
require 'yaml'
require 'ostruct'
require 'base64'

OCR_WEB_SERVICE_CLIENT_LIB_DIR  = File.join(File.dirname(__FILE__), 'ocr_web_service_client')

module Palmade
  module OcrWebServiceClient

    autoload :Runner,                 File.join(OCR_WEB_SERVICE_CLIENT_LIB_DIR, 'runner')
    autoload :WebService,             File.join(OCR_WEB_SERVICE_CLIENT_LIB_DIR, 'web_service')
    autoload :OCRWebServiceRecognize, File.join(OCR_WEB_SERVICE_CLIENT_LIB_DIR, 'ocr_web_service_recognize')
    autoload :OCRWSInputImage,        File.join(OCR_WEB_SERVICE_CLIENT_LIB_DIR, 'ocrws_input_image')
    autoload :OCRWSSetting,           File.join(OCR_WEB_SERVICE_CLIENT_LIB_DIR, 'ocrws_setting')
    autoload :OCRWSZone,              File.join(OCR_WEB_SERVICE_CLIENT_LIB_DIR, 'ocrws_zone')

    class << self

      def init(logger = nil)
        @logger   = logger || Logger.new(STDOUT)
        @instance = Runner.instance
      end

      def logger
        @logger
      end

      def config
        @config ||= begin
                      config_hash = YAML.load_file(File.join(OCR_WEB_SERVICE_CLIENT_LIB_DIR, '../../../config/ocr_web_service.yml'))
                      OpenStruct.new(config_hash)
                    end
      end

      def ocr_web_service_recognize(filename, filepath)
        @instance.ocr_web_service_recognize(filename, filepath)
      end

    end
  end
end
