source 'http://rubygems.org'

# no version requirement
gem 'rails'

# use podio's client library
gem 'podio'

# used for auth
gem 'omniauth-podio'

# heroku runs postgres in prod
gem 'pg'

# unicorn is a heroku recommended webserver
gem 'unicorn'

# dalli is used for caching
gem 'dalli'

# haml is fun
gem 'haml'

# jquery is also fun
gem 'jquery-rails'

# lots of fun stuff here
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'twitter-bootstrap-rails'
  gem 'turbo-sprockets-rails3'
end

group :development do
  gem 'pry-rails'
  gem 'quiet_assets'
  gem 'sqlite3'
end

group :development, :test do
  gem 'figaro'
  gem 'rspec-rails'
  gem "factory_girl_rails"
end

group :test do
  gem 'turn', :require => false
  gem 'cucumber-rails', :require => false
  gem 'faker'
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner' 
  gem 'spork'
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'guard-rspec'
  gem 'rspec', '>= 2.12.0'
  gem 'spork-rails'
  gem 'guard-spork'
  gem 'ruby_gntp'
  gem 'vcr'
  gem 'webmock'
  gem 'json'
end
