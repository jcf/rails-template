create_file '.rvmrc', <<-RVMRC
rvm_gemset_create_on_use_flag=1
rvm use 1.9.2p0
rvm gemset use #{app_name}
RVMRC

gem 'haml-rails', '>= 0.2'
gem 'compass', '>= 0.10.5'
gem 'compass-susy-plugin', '>= 0.8.1'
gem 'devise', '>= 1.1.3'
gem 'formtastic', '>= 1.2.0.beta'
gem 'rspec-rails', '>= 2.0.1', :group => :test
gem 'guard', '>= 0.1.5', :group => :test
gem 'factory_girl_rails', '>= 1.0.0', :group => :test
gem 'factory_girl_generator', '>= 0.0.1', :group => [:test, :development]
gem 'capybara', '>= 0.3.9', :group => :test
gem 'steak', '>= 0.4.0.a5', :group => :test

application <<-RUBY

    config.generators do |g|
      g.test_framework :rspec, :fixture => true, :views => false
      g.integration_tool :rspec, :fixture => true, :views => true
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
RUBY

remove_file 'public/javascripts/controls.js'
remove_file 'public/javascripts/dragdrop.js'
remove_file 'public/javascripts/effects.js'
remove_file 'public/javascripts/prototype.js'

get 'http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js',
  'public/javascripts/jquery.js'

get 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js',
  'public/javascripts/jquery-ui.js'

# We can't use get because it won't hit SSL encrypted pages
run 'curl --silent https://github.com/rails/jquery-ujs/raw/master/src/rails.js > public/javascripts/rails.js'

gsub_file 'config/application.rb',
  'config.action_view.javascript_expansions[:defaults] = %w()',
  'config.action_view.javascript_expansions[:defaults] = %w(jquery.js jquery-ui.js rails.js)'

remove_file 'app/views/layouts/application.html.erb'
create_file 'app/views/layouts/application.html.haml', <<-HAML
!!! 5
%html
  %head
    %title #{app_name.humanize}
    = stylesheet_link_tag :all
    = javascript_include_tag :defaults
    = csrf_meta_tag
  %body
    = yield
HAML

create_file 'log/.gitkeep'
create_file 'tmp/.gitkeep'

git :init
git :add => '.'

log <<-PLAIN

Run the following commands to complete the setup of #{app_name.humanize}:

 * cd #{app_name}
 * bundle install
 * rails g rspec:install
PLAIN

# * rails g devise:install
# * rails g devise MODEL
