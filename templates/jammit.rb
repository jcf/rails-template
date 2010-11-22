create_file 'config/assets.yml', <<-YAML
gzip_assets: off
package_path: packaged

javascripts:
  global:
    - public/javascripts/jquery.js
    - public/javascripts/**/*.js

stylesheets:
YAML
