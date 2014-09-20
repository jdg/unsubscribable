# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unsubscribable/version'

Gem::Specification.new do |spec|
  spec.name          = "unsubscribable"
  spec.version       = Unsubscribable::VERSION
  spec.authors       = ["Jonathan George"]
  spec.email         = ["jonathan@jdg.net"]
  spec.summary       = %q{The easiest way to manage notification settings and unsubscribe links.}
  spec.description   = %q{The easiest way to manage notification settings and unsubscribe links.}
  spec.homepage      = "http://github.com/jdg/unsubscribable"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
end
