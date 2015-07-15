# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'less/rails/bootstrap-datepicker/datepicker/version'

Gem::Specification.new do |spec|
  spec.name          = 'less-rails-bootstrap-datepicker-datepicker'
  spec.version       = Less::Rails::Bootstrap::Datepicker::VERSION
  spec.authors       = ['Erich Quintero']
  spec.email         = ['qbantek@gmail.com']

  spec.summary       = %q{A date picker for Twitter Bootstrap.}
  spec.description   = %q{Integrates a datepicker with Rails assets pipeline and includes the LESS source files.}
  spec.homepage      = 'https://github.com/qbantek/less-rails-bootstrap-datepicker-datepicker'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry', '~> 0.10.1'
  spec.add_development_dependency 'json', '~> 1.8'
end
