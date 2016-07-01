$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'babel_train/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'babel_train'
  s.version     = BabelTrain::VERSION
  s.authors     = ['Jeremy Nicoll']
  s.email       = ['eltiare@github']
  s.homepage    = 'https://github.com/eltiare/babel_train'
  s.summary     = 'Backend for i18n that auto-scopes by folder and filename.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '~> 4'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'

end
