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

      def init(target_path, logger = nil)
        load_config(target_path)
        @logger   = logger || Logger.new(STDOUT)
        @instance = Runner.instance
      end

      def logger
        @logger
      end

      def load_config(target_path)
        yml_path = File.join(target_path, 'config/ocr_web_service.yml')
        if File.exists?(yml_path)
          config_hash = YAML.load_file(yml_path)
          @config     = OpenStruct.new(config_hash)
        end
      end

      def config
        @config
      end

      def ocr_web_service_recognize(target)
        @instance.ocr_web_service_recognize(target)
      end

    end
  end
end
