require 'spec_helper'

describe 'httpd::default' do
  describe command('curl http://localhost') do
    its(:stdout) { should match(/Welcome Home/) }
  end
end
