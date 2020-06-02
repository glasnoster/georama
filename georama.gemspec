# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'georama/version'

Gem::Specification.new do |spec|
  spec.name          = "georama"
  spec.version       = Georama::VERSION
  spec.authors       = ["Martin Pretorius"]
  spec.email         = ["glasnoster@gmail.com"]
  spec.summary       = %q{A simple google maps url parser}
  spec.description   = %q{Extract information like coordinates from a google maps url}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "semvergen", "~> 1.3"
  spec.add_development_dependency "bundler", ">= 1"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard-rspec", "~> 4.0"
  spec.add_development_dependency "pry"
end
