require 'machinist'
Dir[Rails.root.join('spec/blueprints/**/*.rb')].each { |f| require f }
