# Database & Storage
gem 'pg'
gem 'paranoia'
gem 'kgio'
gem 'dalli'
gem 'seed-fu', '~> 2.2'

# Template & View
gem 'slim-rails', '~> 1.0'
gem 'draper'
gem 'kaminari'

gem_group :development do
  gem 'quiet_assets'
  gem 'thin'
end

gem_group :development, :test do
  gem 'rspec-rails', '~> 2.11'
end

gem_group :test do
  gem 'cucumber-rails', '~> 1.3', require: false
  gem 'database_cleaner'
  gem 'machinist'
  gem 'pickle'
  gem 'poltergeist'
  gem 'shoulda-matchers'
end

gem_group :extras do
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'rb-readline'
end
