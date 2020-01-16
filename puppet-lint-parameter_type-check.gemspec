Gem::Specification.new do |spec|
    spec.name        = 'puppet-lint-parameter_type-check'
    spec.version     = '1.0.0'
    spec.homepage    = 'https://github.com/iasha102/puppet-lint-parameter_type-check'
    spec.license     = 'MIT'
    spec.author      = 'Iacob Nicolaev'
    spec.email       = 'nicolaev.iacob@gmail.com'
    spec.files       = Dir[
      'README.md',
      'LICENSE',
      'lib/**/*',
      'spec/**/*',
    ]
    spec.test_files  = Dir['spec/**/*']
    spec.summary     = 'A puppet-lint plugin to check if parameters in Classes and Defines has types declared.'
    spec.description = <<-EOF
      A puppet-lint plugin to check if parameters in Classes and Defines has types declared.
    EOF

    spec.add_dependency             'puppet-lint', '~> 2.0'
    spec.add_development_dependency 'rspec', '~> 3.0'
    spec.add_development_dependency 'rspec-its', '~> 1.0'
    spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
    spec.add_development_dependency 'rake'
    spec.add_development_dependency 'simplecov'
  end