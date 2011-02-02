# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "palmade/ocr_web_service_client/version"

Gem::Specification.new do |s|
  s.name        = "ocr_web_service_client"
  s.version     = Palmade::OcrWebServiceClient::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["palmade"]
  s.email       = %q{}
  s.homepage    = %q{}
  s.summary     = %q{Ocr Web Service Client}

  s.rubyforge_project = "ocr_test"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
