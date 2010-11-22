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

# generate :controller, 'home'
# route "root => 'home#index'"
