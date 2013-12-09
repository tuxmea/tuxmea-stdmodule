# stdmodule

standard puppet module including basic rspec
using rspec-puppet with puppetlabs spec helper
and puppet lint parser

## puppet code

put your puppet code into manifests folder
always add documentation to your puppet code

## rspec code

Gemfile has lists of gems and github repos which
are needed.

Rakefile has list of tasks which need to run

.fixtures.yml creates a symlink for your module
(optionally you can add remote repositores (github)
 on which you have dependencies.)

spec/spec_helper.rb configures your rspec environment

spec/fixtures/hiera has all of your hiera test variables/parameters

spec/classes/ has all of your rspec code

