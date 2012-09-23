guard 'bundler' do
  watch('Gemfile')
end

spork_opts = {
  cucumber_env: {'RAILS_ENV' => 'test'},
  rspec_env: {'RAILS_ENV' => 'test'}
}

guard 'spork', spork_opts do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/environments/test.rb')
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  # watch(%r{features/support/}) { :cucumber }
end

guard 'rspec', cli: '--drb', version: 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb') { 'spec' }

  watch(%r{^app/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }

  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$}) do |m|
    "spec/#{m[1]}#{m[2]}_spec.rb"
  end

  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
    ["spec/routing/#{m[1]}_routing_spec.rb",
     "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
     "spec/acceptance/#{m[1]}_spec.rb"]
  end

  # watch(%r{^spec/support/(.+)\.rb$}) { 'spec' }

  watch('app/controllers/application_controller.rb') { 'spec/controllers' }
end

guard 'cucumber', cli: '--drb --no-profile --format pretty --tags ~@wip' do
  watch(%r{^features/.+\.feature$})

  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) do |m|
    Dir[File.join("**/#{m[1]}.feature")].first
  end
end
