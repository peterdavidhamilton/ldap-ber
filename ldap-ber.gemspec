lib = File.expand_path('../lib', __FILE__)
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
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.metadata['yard.run']  = 'yri'
  spec.required_ruby_version = '>= 2.3.0'

  spec.add_runtime_dependency 'dry-core'
  spec.add_runtime_dependency 'dry-initializer'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
end
