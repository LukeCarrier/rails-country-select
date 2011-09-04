# encoding: UTF-8

$:.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name        = "country-select"
  s.version     = CountrySelect::VERSION
  s.authors     = ["Luke Carrier"]
  s.email       = ["hey@lukecarrier.me"]
  s.homepage    = "http://github.com/LukeCarrier/rails-country-select"
  s.summary     = %q{Provides an easy to use and consistent suite of helpers and validations for use with countries.}
  s.description = %q{View helpers and validations for managing dates.}

  #s.rubyforge_project = "country-select"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "nokogiri"
end
