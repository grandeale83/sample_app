source 'https://rubygems.org'
ruby '1.9.3'
#ruby-gemset=railstutorial_rails_4_0

gem 'rails', '4.0.8'
gem 'bootstrap-sass', '2.3.2.0'
gem 'sprockets', '2.11.0'


group :development, :test do
  ##
  # This comment for change database used by the web-app
  # Default database is sqlite3, for deployment on Heroku
  # it should be PostgreSQL (gem 'pg')
  # gem 'sqlite3', '1.3.8'
  #
  ##
  gem 'pg', '0.15.1'
  gem 'rspec-rails', '2.13.1'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
end

gem 'sass-rails', '4.0.3'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'rails_12factor', '0.0.2'
end