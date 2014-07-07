# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gourmet/version'

Gem::Specification.new do |spec|
  spec.name          = 'gourmet'
  spec.version       = Gourmet::VERSION
  spec.authors       = ['Andrew Berls']
  spec.email         = ['andrew.berls@gmail.com']
  spec.summary       = %q{Gourmet Service Objects for Rails}
  spec.description   = %q{An implementation of Service Objects for extracting functionality out of Rails controllers. Originally described by Philippe Creux in http://brewhouse.io/blog/2014/04/30/gourmet-service-objects.html}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rspec', '~> 3.0.0'
end
