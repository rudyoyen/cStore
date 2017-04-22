require 'rspec/core/rake_task'

task :default => :run

task :run do
    ruby "./lib/main.rb"
end

RSpec::Core::RakeTask.new(:test) do |task|
  task.rspec_opts = ['--color', '--format', 'doc']
  task.verbose = false
end