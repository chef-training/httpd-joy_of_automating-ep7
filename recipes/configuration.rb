#
# Cookbook:: httpd
# Recipe:: configuration
#
# Copyright:: (c) 2016 The Authors, All Rights Reserved.
file '/var/www/html/index.html' do
  content '<h1>Welcome Home!</h1>'
end
