require 'rails/application'
require 'cucumber/rails'

Capybara.default_selector = :css
ActionController::Base.allow_rescue = false

DatabaseCleaner.strategy = :transaction
Cucumber::Rails::Database.javascript_strategy = :truncation
