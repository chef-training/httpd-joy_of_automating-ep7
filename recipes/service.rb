#
# Cookbook:: httpd
# Recipe:: service
#
# Copyright:: (c) 2016 The Authors, All Rights Reserved.
service 'httpd' do
  action [:start, :enable]
end
