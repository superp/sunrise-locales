# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sunrise/locales/version"

Gem::Specification.new do |s|
  s.name = "sunrise-locales"
  s.version = Sunrise::Locales::VERSION.dup
  s.platform = Gem::Platform::RUBY 
  s.summary = "Locales plugin for sunrise-cms"
  s.description = "Locales plugin for Sunrise CMS via aimbulance"
  s.authors = ["Pavel Galeta"]
  s.email = "pavel.galeta@gmail.com"
  s.rubyforge_project = "sunrise-locales"
  s.homepage = "https://github.com/superp/sunrise-locales"
  
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.test_files = Dir["{spec}/**/*"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.require_paths = ["lib"]
  
  s.add_dependency("sunrise-cms", ">= 0.2.0")
end
