generate 'devise:install'
generate 'devise User'

application "config.action_mailer.default_url_options = {host: #{app_name.classify}.settings.host}"
application "config.assets.initialize_on_precompile = false"

# This is done here to ensure the require is done before any other config.
inject_into_file 'config/application.rb', after: "  class Application < Rails::Application\n" do
  "    require '#{app_name}/settings'\n"
end

route "root to: 'home#index'"

generate 'devise:views'

%w(haml hpricot ruby_parser slim haml2slim).each do |g|
  run "gem which #{g} &>/dev/null || gem install #{g}"
end

<<-SH.each_line { |line| run line }
  for i in `find app/views/devise -name '*.erb'` ; do html2haml -e $i ${i%erb}haml ; rm $i ; done
  for i in `find app/views/devise -name '*.haml'` ; do haml2slim $i ${i%haml}slim ; done
  for i in `find app/views/devise -name '*.haml'` ; do rm $i ; done
SH

rake 'db:migrate db:test:clone_structure'
