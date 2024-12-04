# frozen_string_literal: true

require_relative 'lib/scalar/version'

Gem::Specification.new do |spec|
  spec.name = 'scalar_ruby'
  spec.version = Scalar::VERSION
  spec.authors = ['Dmytro Shevchuk', 'Serhii Ponomarov']
  spec.email = ['dmytro@hey.com', 'sergii.ponomarov@gmail.com']

  spec.summary = 'A gem to automate using Scalar with Ruby apps'
  spec.homepage = 'https://github.com/dmytroshevchuk/scalar_ruby'
  spec.license = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['rubygems_mfa_required'] = 'true'
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files = Dir['{lib}/**/*', 'Rakefile', 'README.md']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 3.0', '< 3.4'
end
