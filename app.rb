# Prevent automatic bundle install by Rails app generator
def run_bundle; end

def path(relative)
  File.expand_path("../#{relative}", __FILE__)
end

def clean(path)
  gsub_file path, /#.*\n/, "\n"
  gsub_file path, /\n^\s*\n/, "\n"
end

# Commit all changes with given message.
#
# The commit operation will attempt to sign the commit using your GPG key. This
# needs to be configured as `user.signingkey=<KEY_ID>` in your git config.
def commit_all(message)
  yield if block_given?

  git add: '.'
  git commit: %(-S -aqm "#{message}")
end

git :init

commit_all 'Initial commit' do
  %w(
    README
    README.rdoc
    app/assets/images/rails.png
    app/views/layouts/application.html.erb
    doc/README_FOR_APP
    public/index.html
    test
  ).each { |path| remove_file path }
end

commit_all 'Configure RSpec generators' do
  application <<-RUBY

    config.generators do |g|
      g.test_framework :rspec, routing_specs: false, views: false
    end
  RUBY
end

if ua = ENV['GA_TRACKER']
  commit_all 'Configure Rack Google Analytics' do
    environment "config.middleware.use Rack::GoogleAnalytics, tracker: '#{ua}'",
      env: :production
  end
end

commit_all 'Setup default rake task' do
  append_to_file 'Rakefile', <<-RUBY.gsub(/^\s+/, '')
    task(:default).clear
    task :default => [:spec, :cucumber]
  RUBY
end

commit_all 'Install & configure gems' do
  directory path('templates'), destination_root

  apply path('recipes/gems.rb')
  apply path('recipes/pg_config.rb')

  run 'bundle install --quiet'
end

rake 'db:create:all'

commit_all 'Setup authentication' do
  apply path('recipes/authentication.rb')
end

commit_all 'Clean-up generated files' do
  %w(
    Gemfile
    config/application.rb
    config/environments/development.rb
    config/environments/test.rb
    config/environments/production.rb
  ).each { |path| clean path }
end
