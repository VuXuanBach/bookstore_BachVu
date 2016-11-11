source 'https://rubygems.org'
ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

gem 'bootstrap-sass'
gem 'sprockets'
gem 'bcrypt-ruby'
gem 'faker'
gem 'rails_admin', '~> 1.0'
gem 'haml'
gem 'devise', '3.4.1'
gem 'devise-async'
gem 'sidekiq'
gem 'cancancan', '~> 1.10'
gem "paperclip", "~> 5.0.0"
gem 'pg_search'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use sqlite3 as the database for Active Record
group :development, :test do
  gem 'pg'
  gem 'rspec-rails', '>=2.13.1'
  gem "erb2haml"
  gem 'letter_opener'
  gem 'byebug'
  gem 'factory_girl_rails'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'rspec-its'
  gem 'shoulda-matchers'
  gem 'coveralls', require: false
  gem 'simplecov', require: false
end

# bundle exec rake doc:rails generates the API under doc/api.
group :doc do
  gem 'sdoc', '~> 0.4.0', require: false
end
