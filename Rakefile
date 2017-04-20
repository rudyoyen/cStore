begin
  require 'rspec/core/rake_task'

  task :default => :spec

  RSpec::Core::RakeTask.new(:spec) do |task|
    task.rspec_opts = ['--color', '--format', 'doc']
    task.verbose = false
  end
rescue LoadError
  # no rspec available
end