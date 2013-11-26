require 'test/unit'
require 'mocha/setup'
require 'rspec-puppet'
require 'puppetlabs_spec_helper/module_spec_helper'
require 'hiera-puppet-helper/rspec'
require 'hiera'
require 'puppet/indirector/hiera'

# config hiera to work with let(:hiera_data)
def hiera_stub
  config = Hiera::Config.load(hiera_config)
  config[:logger] = 'puppet'
  Hiera.new(:config => config)
end

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

# include common helpers
support_path = File.expand_path(File.join(File.dirname(__FILE__), '..',
                                          'spec/support/*.rb'))
Dir[support_path].each {|f| require f}

RSpec.configure do |c|
  c.config = '/doesnotexist'
  c.manifest_dir = File.join(fixture_path, 'manifests')
  c.mock_with :mocha
  c.mock_framework = :rspec
  c.before(:each) do
    Puppet::Indirector::Hiera.stub(:hiera => hiera_stub)
  end
end

