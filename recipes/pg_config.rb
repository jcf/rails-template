file = 'config/database.yml'

remove_file file

create_file file, <<RUBY
development: &dev
  adapter: postgresql
  encoding: unicode
  database: #{app_name}_development
  pool: 5
  username: <%= ENV['USER'] %>
  password:

test:
  <<: *dev
  database: #{app_name}_test

production:
  <<: *dev
  database: #{app_name}_production
RUBY
