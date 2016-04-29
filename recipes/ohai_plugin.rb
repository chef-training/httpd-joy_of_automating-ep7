#
# Cookbook Name:: httpd
# Recipe:: ohai_plugin
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
ohai 'reload_apache' do
  plugin 'apache'
  action :nothing
end

cookbook_file "#{node['ohai']['plugin_path']}/apache_modules.rb" do
  source 'apache_modules.rb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :reload, 'ohai[reload_apache]', :immediately
end

include_recipe 'ohai::default'
