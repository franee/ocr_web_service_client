require 'rubygems'
require 'net/http'
require 'uri'
require 'singleton'
require 'builder'
require 'logger'
require 'xml'
require 'yaml'
require 'ostruct'
require 'base64'

begin
  require 'system_timer'
  PalmadeTimer = SystemTimer
rescue LoadError
  require 'timeout'
  PalmadeTimer = Timeout
end


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
        @logger = logger || Logger.new(STDOUT)
        @runner = Runner.instance
      end

      def logger
        @logger
      end

      def load_config(target_path)
        yml_path = File.join(target_path, 'config/ocr_web_service.yml')
        if File.exists?(yml_path)
          config_hash = YAML.load_file(yml_path)
          @config     = OpenStruct.new(config_hash)
        else
          raise "No ocr_web_service.yml file"
        end
      end

      def config
        @config
      end

      def ocr_web_service_recognize(target)
        @runner.ocr_web_service_recognize(target)
      end

    end
  end
end
