# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ocr_web_service_client}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["palmade"]
  s.date = %q{2011-02-02}
  s.description = %q{Ocr Web Service Client}
  s.email = %q{}
  s.extra_rdoc_files = ["COPYING", "LICENSE", "README", "lib/palmade/ocr_web_service_client.rb", "lib/palmade/ocr_web_service_client/web_service.rb", "lib/palmade/ocr_web_service_client/runner.rb", "lib/palmade/ocr_web_service_client/version.rb", "lib/palmade/ocr_web_service_client/ocr_web_service_recognize.rb", "lib/palmade/ocr_web_service_client/ocrws_setting.rb", "lib/palmade/ocr_web_service_client/ocrws_zone.rb", "lib/palmade/ocr_web_service_client/ocrws_input_image.rb"]
  s.files = ["ocr_web_service_client.gemspec", "Rakefile", "config/ocr_web_service.yml.sample", "COPYING", "LICENSE", "CHANGELOG", "README", "Manifest", "lib/palmade/ocr_web_service_client.rb", "lib/palmade/ocr_web_service_client/web_service.rb", "lib/palmade/ocr_web_service_client/runner.rb", "lib/palmade/ocr_web_service_client/version.rb", "lib/palmade/ocr_web_service_client/ocr_web_service_recognize.rb", "lib/palmade/ocr_web_service_client/ocrws_setting.rb", "lib/palmade/ocr_web_service_clienty/ocrws_zone.rb", "lib/palmade/ocr_web_service_client/ocrws_input_image.rb"]
  s.homepage = %q{}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Ocr_web_service_client", "--main", "README"]
  s.require_paths = ["lib/palmade"]
  s.rubyforge_project = %q{palmade}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ocr Web Service Client}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
