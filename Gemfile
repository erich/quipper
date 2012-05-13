source "https://rubygems.org"

gem "rails", "3.2.3"
gem "jquery-rails"

gem "bson_ext"
gem "haml","3.1.4"
gem "mongoid"
gem "twitter-bootstrap-rails"
gem "activevalidators"

group :development do
  gem "haml-rails"
  gem "puma"
  gem "quiet_assets"
  gem "therubyracer"
  gem "tork"
end

group :test do
  gem "database_cleaner"
  gem "fabrication"
  gem "faker"
  gem "minitest"
  gem "minitest-rails", git: "https://github.com/erich/minitest-rails.git"
  gem "mongoid-minitest"
  gem "capybara"
  gem "capybara_minitest_spec"
  gem "launchy"
end

group :production do
  gem "thin"
end

group :assets do
  gem "coffee-rails", "~> 3.2.1"
  gem "sass-rails",   "~> 3.2.3"
  gem "uglifier",     ">= 1.0.3"
end
