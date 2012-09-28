begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new do |t|
    t.cucumber_opts = %w{--format progress}
  end
rescue LoadError => e
  task :cucumber do puts "Cucumber isn't available" end
end
