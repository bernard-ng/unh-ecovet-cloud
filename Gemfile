# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.0'

gem 'cssbundling-rails'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'puma', '~> 6.0.0', '< 7'
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'
# gem "redis", ">= 4.0.1"
# gem "kredis"
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'image_processing', '~> 1.2'
gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'bootstrap_form', '~> 5.4'
gem 'devise', '~> 4.9'
gem 'dotenv-rails', groups: %i[development test production]
gem 'faker'
gem 'httparty'
gem 'sd_notify', '~> 0.1.0'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]
end

group :development do
  gem 'capistrano'
  gem 'capistrano3-puma', '6.0.0.beta.1'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'spring'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
