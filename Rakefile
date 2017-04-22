begin
  require 'rspec/core/rake_task'

  task :default => :test

  RSpec::Core::RakeTask.new(:test) do |task|
    task.rspec_opts = ['--color', '--format', 'doc']
    task.verbose = false
  end

rescue LoadError
  # no rspec available
end