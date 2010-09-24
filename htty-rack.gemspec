# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "htty-rack"
  s.version     = File.read("VERSION")
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Florian Gilcher"]
  s.email       = ["florian.gilcher@asquera.de"]
  s.homepage    = "http://www.github.com/Asquera/htty-rack"
  s.summary     = "htty-rack is htty for rack applications"
  s.description = "A CLI for rack applications based on htty."

  s.add_dependency "htty", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
