require 'spec_helper'
hiera_file = 'spec/fixtures/hiera/hiera.yaml'   # <- required to find hiera configuration file

# test our main class (init.pp)
describe 'stdmodule', :type => :class  do

    # test without hiera lookup (using class defaults)
    context 'without hiera data' do
        it { should contain_class('stdmodule') }                        # <- check for classes included
        it { should contain_class('stdmodule').with_myparam('foo') }    # <- check for classes with parameters
        it { should contain_class('stdmodule::basic') }                 # <- check for subclasses
        it { should contain_class('stdmodule::package_file_service') }
        it { should contain_stdmodule__defines('foobar_define') }       # <- check for defines
    end

    # test with explicit params given on class definition
    context 'with explicit data' do
        let(:params) {{                                                 # <- set explizit params
            :myparam => 'newvalue'
        }}
        it { should contain_class('stdmodule').with_myparam('newvalue') }
    end

    # test with explicit hiera lookup
    context 'with explicit hiera lookup' do
        # set hiera_config
        let (:hiera_config) { hiera_file }

        hiera = Hiera.new(:config => hiera_file)                        # <- use Hiera ruby class
        variable = hiera.lookup('stdmodule::myparam', nil, nil)         # <- do hiera lookup
        let (:params) {{
            :myparam => variable                                        # <- set parameter to hiera lookup
        }}
        it { should contain_class('stdmodule').with_myparam(variable) }
    end
end
