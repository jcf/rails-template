paths = lambda { |path| File.expand_path("../#{path}", __FILE__) }

def cleanup(path)
  gsub_file path, /#.*\n/, "\n"
  gsub_file path, /\n^\s*\n/, "\n"
end

def commit_all(message)
  git add: '.'
  git commit: %(-aqm "#{message}")
end

git :init

%w(
  README
  README.rdoc
  app/assets/images/rails.png
  app/views/layouts/application.html.erb
  doc/README_FOR_APP
  public/index.html
  test
).each { |path| remove_file path }

commit_all 'Initial commit'

application <<-RUBY

    config.generators do |g|
      g.test_framework :rspec, routing_specs: false, views: false
    end
RUBY

commit_all 'Configure RSpec generators'

append_to_file 'Rakefile', <<RUBY
task(:default).clear
task :default => [:spec, :cucumber]
RUBY

commit_all 'Setup default rake task'

directory paths['templates'], destination_root
apply paths['recipes/gems.rb']
apply paths['recipes/pg_config.rb']

commit_all 'Install & configure gems'

%w(
  Gemfile
  config/application.rb
  config/environments/development.rb
  config/environments/test.rb
  config/environments/production.rb
).each { |path| cleanup path }

commit_all 'Cleanup generated files'
