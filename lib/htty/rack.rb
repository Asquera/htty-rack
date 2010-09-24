Dir.glob "#{File.dirname __FILE__}/rack/*.rb" do |f|
  require File.expand_path("#{File.dirname __FILE__}/rack/" +
                           File.basename(f, '.rb'))
end

require 'rack'
HTTY::CLI::Commands::Help.register_additional_category("Rack")

module HTTY
  module Rack
    VERSION = File.read("#{File.dirname __FILE__}/../../VERSION").chomp
    
    
    def self.build_app(filename = nil)
      config_file_name = File.basename(filename || find_config_file)
      config_file = File.read(config_file_name)
      app = ::Rack::Builder.new { instance_eval(config_file) }.to_app
      [config_file_name, app]
    end

    def self.find_config_file
      if Dir.glob("config.ru").length > 0
        File.join(Dir.pwd,"config.ru")
      elsif Dir.pwd != "/"
        Dir.chdir("..") { find_config_file }
      else
        raise "Cannot find config.ru"
      end
    end
  end
  
  self.requests_util = HTTY::Rack::RequestsUtil
end
