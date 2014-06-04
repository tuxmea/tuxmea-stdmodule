require 'test/unit'
require 'mocha/setup'
require 'puppetlabs_spec_helper/module_spec_helper'
require 'puppet/indirector/hiera'
require 'hiera'


fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

# include common helpers
support_path = File.expand_path(File.join(File.dirname(__FILE__), '..',
                                          'spec/support/*.rb'))
Dir[support_path].each {|f| require f}

RSpec.configure do |c|
  c.before(:each) do
    # work around https://tickets.puppetlabs.com/browse/PUP-1547
    # ensure that there's at least one provider available by emulating that any command exists
    if Puppet::version < '3'
      # ONLY WORKING WITH PUPPET 2.X !!
      require 'puppet/provider/confine/exists'
      Puppet::Provider::Confine::Exists.any_instance.stubs(:which => '')
    else
      # ONLY WORKING WITH PUPPET 3.X !!
      require 'puppet/confine/exists'
      Puppet::Confine::Exists.any_instance.stubs(:which => '')
    end
    # avoid "Only root can execute commands as other users"
    Puppet.features.stubs(:root? => true)
  end
  c.config = '/doesnotexist'
  c.manifest_dir = File.join(fixture_path, 'manifests')
  c.mock_with :mocha
end
