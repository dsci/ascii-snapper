# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ascii-snapper/version'

Gem::Specification.new do |spec|
  spec.name          = "ascii-snapper"
  spec.version       = AsciiSnapper::VERSION
  spec.authors       = ["Daniel Schmidt"]
  spec.email         = ["dsci@code79.net"]
  spec.description   = %q{Rails midleware to convert ASCII-8BIT params to UTF8}
  spec.summary       = %q{Rails midleware to convert ASCII-8BIT params to UTF8}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
