require 'spec_helper'

describe 'stdmodule' do
    let(:hiera_data) {{
        'stdmodule::myparam' => 'myvalue'
    }}
    it { should contain_class('stdmodule') }
    it { should contain_class('stdmodule').with_myparam('myvalue') }
end
