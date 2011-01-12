require 'pathname'

def apply(name)
  super "#{File.dirname(__FILE__)}/templates/#{name}.rb"
end

# Remove Rails cruft
%w(
  README
  test
  public/index.html
  public/favicon.ico
  public/robots.txt
  public/images/rails.png
).each { |path| remove_file path }

# Create a sensible .rvmrc file
create_file '.rvmrc', <<-EOS
rvm_gemset_create_on_use_flag=1
rvm use 1.9.2@#{app_name}
EOS

# Add my favourite gems to Gemfile
apply 'gems'

# Use our preferred generators
application <<-RUBY

    config.generators do |g|
      g.test_framework :rspec, :fixture => true, :views => false
      g.integration_tool :rspec, :fixture => true, :views => true
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
RUBY

# Create a Haml application layout
apply 'haml_layout'

apply 'application_helper'

# Beautiful jQuery
apply 'jquery'

# Postgres configuration
apply 'database_config'

apply 'core_extensions'

# Keep these directories even though we ignore what's in them
create_file 'log/.gitkeep'
create_file 'tmp/.gitkeep'

run "rvm use 1.9.2@#{app_name}"
run 'gem install bundler && bundle install'

generate 'rspec:install'
generate 'cucumber:install --capybara --rspec --spork'
generate 'pickle --path --email'
generate 'friendly_id'
generate 'formtastic:install'
generate 'devise:install'
generate 'devise User'
generate 'devise Admin'

run 'compass init rails . -x sass --using blueprint --sass-dir app/stylesheets --css-dir public/stylesheets'

git :init
git :add => '.'
