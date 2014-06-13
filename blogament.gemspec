$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blogament/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blogament"
  s.version     = Blogament::VERSION
  s.authors     = ["AimeKnight"]
  s.email       = ["AimeeMarieKnight@gmail.com"]
  s.homepage    = "https://github.com/AimeeKnight/Blogament"
  s.summary     = "Blogament is a Rails Engine designed to provide its host with blogging and commenting features."
  s.description = "Blogament is a Rails Engine"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "spec/factories/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1.1"
  s.add_dependency "jquery-rails"
  s.add_dependency "tinymce-rails"
  s.add_dependency "sass-rails", "4.0.3"
  s.add_dependency "bootstrap-sass", "~> 3.1.1"
  s.add_dependency "carrierwave"
  s.add_dependency "mini_magick"
  #s.add_dependency "fog"
  s.add_dependency "bootswatch-rails"

  s.add_development_dependency "pg"
  s.add_development_dependency "rspec-rails", "~> 3.0"
  s.add_development_dependency "rspectacular", "~> 0.38"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "capybara-webkit"
  s.add_development_dependency "selenium-webdriver"
  s.add_development_dependency 'database_cleaner'
end
