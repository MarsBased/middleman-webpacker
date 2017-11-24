# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'middleman-webpacker/version'

Gem::Specification.new do |s|
  s.name                  = 'middleman-webpacker'
  s.version               = MiddlemanWebpacker::VERSION
  s.platform              = Gem::Platform::RUBY
  s.authors               = [ 'MarsBased' ]
  s.email                 = [ 'hello@marsbased.com' ]
  s.homepage              = 'https://github.com/marsbased/middleman-webpacker'
  s.summary               = %q{ Extension to use Middleman with Webpack }
  s.description           = %q{ Extension to use Middleman with Webpack }
  s.license               = 'MIT'

  s.files                 = `git ls-files -z`.split("\0")
  s.test_files            = `git ls-files -z -- {spec,features,fixtures}/*`.split("\0")
  s.require_paths         = [ 'lib' ]

  s.required_ruby_version = '>= 2.2.0'

  s.add_runtime_dependency('middleman-core', ['>= 4.2.1'])

  s.add_development_dependency('rake')
  s.add_development_dependency('cucumber')
  s.add_development_dependency('rspec')
end
