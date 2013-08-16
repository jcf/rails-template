# Database & Storage
gem 'pg',       '~> 0.16'

# Rails powerups
gem 'devise',    '~> 3.0.0.rc'
gem 'kgio',      '~> 2.8.0'
gem 'dalli',     '~> 2.6.4'
gem 'pry-rails', '~> 0.3.2'
gem 'hashr',     '~> 0.0.22'

# Template & View
gem 'slim-rails', '~> 2.0'
gem 'draper',     '~> 1.2.1'
gem 'kaminari',   '~> 0.14.1'

gem 'puma', '~> 2.5.1'

# Monitoring & Analytics
gem 'newrelic_rpm', '~> 3.6'
gem 'rack-google-analytics', '~> 0.12.0'

gem_group :development do
  gem 'quiet_assets', '~> 1.0.2'
end

gem_group :development, :test do
  gem 'rspec-rails', '~> 2.14.0'
end

gem_group :test do
  gem 'cucumber-rails', '~> 1.3'
  gem 'database_cleaner', '~> 1.1.1'
  gem 'factory_girl', '~> 4.2.0'
  gem 'poltergeist', '~> 1.3.0'
  gem 'shoulda-matchers', '~> 2.3.0'
end
