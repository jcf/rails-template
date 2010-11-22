create_file 'app/helpers/application_helper.rb', <<-RUBY
module ApplicationHelper
  unless Rails.env.development?
    def include_javascripts(name, options = {})
      javascript_include_tag(name, options)
    end

    def include_stylesheets(name, options = {})
      stylesheet_include_tag(name, options)
    end
  end
end
RUBY
