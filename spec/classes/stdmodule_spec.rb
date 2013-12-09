require 'spec_helper'
hiera_config = 'spec/fixtures/hiera/hiera.yaml'
describe 'stdmodule', :type => :class  do
    let (:hiera_config) { hiera_config }
    context 'without hiera data' do
        it { should contain_class('stdmodule') }
        it { should contain_class('stdmodule').with_myparam('foo') }
    end
    context 'with explicit data' do
        let(:params) {{
            :myparam => 'newvalue'
        }}
        it { should contain_class('stdmodule').with_myparam('newvalue') }
    end
    context 'with explicit hiera lookup' do
        hiera = Hiera.new(:config => hiera_config)
        variable = hiera.lookup('stdmodule::myparam', nil, nil)
        let (:params) {{
            :myparam => variable
        }}
        it { should contain_class('stdmodule').with_myparam(variable) }
    end
end
