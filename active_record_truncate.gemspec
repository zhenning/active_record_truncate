# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record_truncate/version'

Gem::Specification.new do |spec|
  spec.name          = "active_record_truncate"
  spec.version       = ActiveRecordTruncate::VERSION
  spec.authors       = ["yinhm"]
  spec.email         = ["epaulin@gmail.com"]
  spec.description   = %q{active_record_truncate}
  spec.summary       = %q{active_record_truncate}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
