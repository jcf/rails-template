require 'machinist/active_record'
require 'pickle/world'

Dir[Rails.root.join('spec/blueprints/**/*.rb')].each { |f| require f }

Pickle.configure do |config|
  config.adapters = [:machinist]
end
