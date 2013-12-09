require 'spec_helper'
hiera_file = 'spec/fixtures/hiera/hiera.yaml'

# test our main class (init.pp)
describe 'stdmodule', :type => :class  do

    # test without hiera lookup (using class defaults)
    context 'without hiera data' do
        it { should contain_class('stdmodule') }
        it { should contain_class('stdmodule').with_myparam('foo') }
    end

    # test with explicit params given on class definition
    context 'with explicit data' do
        let(:params) {{
            :myparam => 'newvalue'
        }}
        it { should contain_class('stdmodule').with_myparam('newvalue') }
    end

    # test with explicit hiera lookup
    context 'with explicit hiera lookup' do
        # set hiera_config
        let (:hiera_config) { hiera_file }

        hiera = Hiera.new(:config => hiera_file)
        variable = hiera.lookup('stdmodule::myparam', nil, nil)
        let (:params) {{
            :myparam => variable
        }}
        it { should contain_class('stdmodule').with_myparam(variable) }
    end
end
