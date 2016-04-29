require 'spec_helper'

chef_gem_path = Dir.glob("/opt/chef/embedded/lib/ruby/gems/*")
chef_gem_path.each do |path|
  gemdirs = Dir.glob("#{path}/gems/*")
  gemdirs = gemdirs.map {|x| x + '/lib'}
  $LOAD_PATH.push(*gemdirs)
end

describe 'httpd::default' do
  describe command('curl http://localhost') do
    its(:stdout) { should match(/Welcome Home/) }
  end

  describe 'apache modules ohai plugin' do
    it 'loads the plugin correctly' do
      cmd = command('ohai -d /etc/chef/ohai_plugins/ apache/modules')
      expect(cmd.stdout).to match(/Loaded Modules/)
    end

    it 'loads the plugin correctly' do
      require 'ohai'
      Ohai::Config[:plugin_path] << '/etc/chef/ohai_plugins'
      o = Ohai::System.new
      # o.plugin_path << '/etc/chef/ohai_plugins'
      o.all_plugins
      expect(o.data['apache']['modules']).not_to be_nil
      expect(o.data['apache']['modules']).to match(/SuperCalifrag/)
    end
  end


end
