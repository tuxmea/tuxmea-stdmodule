require 'rake'
require 'rake/tasklib'
require 'rspec/core/rake_task'
require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint'

desc "Run the tests"
RSpec::Core::RakeTask.new(:test) do |t|
  t.rspec_opts = ['--color', '-f d']
  t.pattern = 'spec/*/*_spec.rb'
end

desc "Generate the docs"
RSpec::Core::RakeTask.new(:doc) do |t|
  t.rspec_opts = ['--format', 'documentation']
  t.pattern = 'spec/*/*_spec.rb'
end

PuppetLint.configuration.with_filename = true

task :default => [:spec_prep, :test]
task :lintonly => [:spec_prep, :lint]
task :clean => :spec_clean

