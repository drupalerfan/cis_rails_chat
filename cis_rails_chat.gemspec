Gem::Specification.new do |s|
  s.name        = "cis_rails_chat"
  s.version     = "0.0.1"
  s.author      = "Erfan Mansuri"
  s.email       = "erfan.m@cisinlabs.com"
  s.homepage    = "http://github.com/ryanb/private_pub"
  s.summary     = "Cis rails chat /sub messaging in Rails."
  s.description = "cis rails chat /sub messaging in Rails through Faye."

  s.files        = Dir["{app,lib,spec}/**/*", "[A-Z]*", "init.rb"] - ["Gemfile.lock"]
  s.require_path = "lib"

  s.add_dependency 'faye'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.8.0'
  s.add_development_dependency 'jasmine', '>= 1.1.1'

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end