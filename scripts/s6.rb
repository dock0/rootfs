##
# Install s6 as the init system

require 'open-uri'
require 'tempfile'

['execline', 's6'].each do |package|
  version = @config['versions'][package]
  url = "https://github.com/akerl/#{package}/releases/dowload/#{version}/#{package}.tar.gz"
  file = Tempfile.new(package)

  open(url, 'rb') { |request| file.write request.read }
  file.close

  `tar -xzkv -C #{@config['build']}/ -f #{file.path}`
end