require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
Cucumber::Rails::Database.javascript_strategy = :truncation
