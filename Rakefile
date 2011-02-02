require 'rubygems'
gem 'echoe'
require 'echoe'

Echoe.new("ocr_web_service_client") do |p|
  p.author = "palmade"
  p.project = "palmade"
  p.summary = "Ocr Web Service Client"

  p.dependencies = [ ]

  p.need_tar_gz = false
  p.need_tgz = true

  p.clean_pattern += [ "pkg", "lib/*.bundle", "*.gem", ".config" ]
  p.rdoc_pattern = [ 'README', 'LICENSE', 'COPYING', 'lib/**/*.rb', 'doc/**/*.rdoc' ]
end

task :test do
end

task :default => :test

