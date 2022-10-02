source 'https://rubygems.org'

ruby '~> 3.1.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'puma', '~> 4.3.12'
gem 'rails', '~> 6.1'
gem 'sass-rails', '~> 5.1'
gem 'sqlite3'
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'coffee-rails', '~> 5.0'
gem 'redis' #, '~> 5.0' # Use Redis adapter to run Action Cable in production
gem 'turbolinks', '~> 5'
# gem 'bcrypt', '~> 3.1.7' # Use ActiveModel has_secure_password
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'active_model_serializers' # JSON serialization
gem 'cancancan', '~> 3.0' # The authorization Gem for Ruby on Rails.
gem 'config' # Easiest way to add multi-environment yaml settings to Rails, Sinatra, Pandrino and other Ruby projects.
gem 'devise'              # Flexible authentication solution for Rails with Warden.
gem 'devise_token_auth'
gem 'fog-aws'             # to use AWS
gem 'graphql'
gem 'lograge'             # An attempt to tame Rails' default policy to log everything.
gem 'rack-cors', require: 'rack/cors' # Rack Middleware for handling Cross-Origin Resource Sharing (CORS), which makes cross-origin AJAX possible.
gem 'rolify'              # Role management library with resource scoping
gem 'sidekiq'             # Simple, efficient background processing for Ruby
gem 'whenever'            # Cron jobs in Ruby

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'factory_bot_rails' # Fixture replacement with many more features
  gem 'flay' # Flay analyzes code for structural similarities.
  gem 'flog' # Flog reports the most tortured code in an easy to read pain report. The higher the score, the more pain the code is in.
  gem 'forgery' # Easy and customizable generation of forged data - used to generate test sample data
  gem 'graphiql-rails'
  gem 'pry' # alternative to the standard IRB shell for Ruby. Helps you to set breakpoint and go through code
  gem 'rack-mini-profiler', require: false # Profiler for your development and production Ruby rack apps.
end

group :test do
  gem 'capybara', '~> 2.13'
  gem 'fakeredis'
  gem 'rails-controller-testing' # controller testing
  gem 'rspec-graphql_matchers'
  gem 'rspec-rails' # , '~> 3.7'
  gem 'rspec-sidekiq' # RSpec for Sidekiq
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1' # Collection of testing matchers extracted from Shoulda
  gem 'timecop' # gem providing "time travel", "time freezing", and "time acceleration" capabilities, making it simple to test time-dependent code.
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails-erd' # generate ERD (Entity-Relationship Diagrams)
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
