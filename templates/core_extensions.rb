inside 'config/initializers/core_extensions' do |path|
  create_file 'enumerable.rb', <<-RUBY
    module Enumerable
      def names
        map { |object| object.try(:name) }
      end
    end
  RUBY

  create_file 'object.rb', <<-RUBY
    class Object
      def when_present(&block)
        yield self if present?
      end
    end
  RUBY
end
