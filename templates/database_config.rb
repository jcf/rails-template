create_file 'config/database.yml', <<-YAML
pg: &pg
  adapter: postgresql
  host: localhost
  min_messages: warning
  encoding: utf-8
  template: template0
  timeout: 5000
  username: <%= `whoami`.chomp %>

development:
  <<: *pg
  database: #{app_name}_development

test:
  <<: *pg
  database: #{app_name}_test

cucumber:
  <<: *pg
  database: #{app_name}_cucumber

production:
  <<: *pg
  database: #{app_name}_development
YAML
