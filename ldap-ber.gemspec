# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'ber/version'

Gem::Specification.new do |spec|
  spec.name          = 'ldap-ber'
  spec.version       = BER::VERSION.dup
  spec.authors       = ['Peter Hamilton']
  spec.email         = ['pete@peterdavidhamilton.com']
  spec.summary       = 'LDAP Basic Encoding Rules: used by rom-ldap'
  spec.description   = 'Refactored from Net:LDAP gem.'
  spec.homepage      = 'http://tbc'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.metadata['yard.run']  = 'yri'
  spec.required_ruby_version = '>= 2.4.0'

  spec.add_runtime_dependency 'dry-core', '~> 0.4'
  spec.add_runtime_dependency 'dry-initializer', '~> 3.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
end
