$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'error_responder/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'error_responder'
  s.version     = ErrorResponder::VERSION
  s.authors     = ['Vadim Stroganov']
  s.email       = ['vadimstroganov@gmail.com']
  s.homepage    = 'https://github.com/vadimstroganov/error_responder.git'
  s.summary     = 'Error responder for Rails API'
  s.description = 'Generator of standard HTTP responses and error serializer for models.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.required_ruby_version = '>= 2.0.0'
  s.add_dependency 'rails', '>= 4.0.0'

  s.add_development_dependency 'bundler', '~> 1.14'
  s.add_development_dependency 'sqlite3'
end
