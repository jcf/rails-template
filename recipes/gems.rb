# Database & Storage
gem 'pg',       '~> 0.14'
gem 'paranoia', '~> 1.1'

# Rails powerups
gem 'devise',   '~> 2.1'
gem 'kgio',     '~> 2.7'
gem 'dalli',    '~> 2.5'
gem 'seed-fu',  '~> 2.2'
gem 'sidekiq',  '~> 2.5'
gem 'hashr', '~> 0'

# Template & View
gem 'slim-rails', '~> 1.0'
gem 'draper',     '~> 0.18'
gem 'kaminari',   '~> 0.14'

gem 'thin'

# Monitoring & Analytics
gem 'newrelic_rpm', '~> 3.5.2'
gem 'rack-google-analytics', '~> 0.11'

gem_group :development do
  gem 'quiet_assets'
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
