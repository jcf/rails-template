gem 'pg'
gem 'jammit', :group => :development
gem 'will_paginate', '~> 3.0.beta'
gem 'haml-rails', '>= 0.2'
gem 'compass', '>= 0.10.5'
gem 'compass-susy-plugin', '>= 0.8.1'
gem 'devise', '>= 1.1.3'
gem 'formtastic', '>=1.1.0'
gem 'friendly_id', '~>3.0'

gem 'rspec', '>= 2.0.1', :group => :test
gem 'rspec-rails', '>= 2.0.1', :group => [:development, :test]
gem 'remarkable', '>= 4.0.0.alpha4', :group => :test
gem 'remarkable_activemodel', '>= 4.0.0.alpha4', :group => :test
gem 'remarkable_activerecord', '>= 4.0.0.alpha4', :group => :test

gem 'factory_girl_rails', :group => :test
gem 'factory_girl_generator', '>= 0.0.1', :group => :development

gem 'cucumber', '>= 0.6.3', :group => :cucumber
gem 'cucumber-rails', '>= 0.3.2', :group => :cucumber
gem 'capybara', '>= 0.3.6', :group => :cucumber
gem 'database_cleaner', '>= 0.5.0', :group => :cucumber
gem 'spork', '>= 0.8.4', :group => :cucumber
gem 'pickle', '>= 0.4.2', :group => :cucumber

gem 'newrelic_rpm', '>= 2.12.3', :group => :production
gem 'hoptoad_notifier', '>= 2.3.6'

gem 'guard', '>= 0.2.2', :group => :test
gem 'guard-rspec', '>= 0.1.5', :group => :test
gem 'guard-cucumber', '>= 0.2.1', :group => :test
