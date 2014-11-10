# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise/vero/version'

Gem::Specification.new do |spec|
  spec.name          = "devise-vero"
  spec.version       = Devise::Vero::VERSION
  spec.authors       = ["Estevão Mascarenhas", "Vinicius Negrisolo"]
  spec.email         = ["estevao.am@gmail.com", "vinicius.negrisolo@gmail.com"]
  spec.summary       = %q{Replace Devise transactional emails with Vero events.}
  spec.description   = %q{Replace Devise transactional emails with Vero events.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4.1"
  spec.add_dependency "devise", "~> 3.2"
  spec.add_dependency "vero"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "pry"
end
