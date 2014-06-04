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

PuppetLint.configuration.ignore_paths = ["vendor/**/*.pp", "spec/**/*.pp"]
PuppetLint.configuration.with_filename = true
PuppetLint.configuration.send("disable_80chars")
# Forsake support for Puppet 2.6.2 for the benefit of cleaner code.
# http://puppet-lint.com/checks/class_parameter_defaults/
PuppetLint.configuration.send('disable_class_parameter_defaults')
# http://puppet-lint.com/checks/class_inherits_from_params_class/
PuppetLint.configuration.send('disable_class_inherits_from_params_class')
PuppetLint.configuration.log_format = "%{path}:%{linenumber}:%{check}:%{KIND}:%{message}"
PuppetLint.configuration.fail_on_warnings = false


exclude_paths = [
  "pkg/**/*",
  "vendor/**/*",
  "spec/**/*",
]
PuppetLint.configuration.ignore_paths = exclude_paths
PuppetSyntax.exclude_paths = exclude_paths

Puppet::Util::Log.level = :warning
Puppet::Util::Log.newdestination(:console)

task :default => [:spec_prep, :test, :lint]
task :testonly => [:spec_prep, :test]
task :lintonly => [:spec_prep, :lint]
task :clean => :spec_clean

