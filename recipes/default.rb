#
# Cookbook:: httpd
# Recipe:: default
#
# Copyright:: (c) 2016 The Authors, All Rights Reserved.
include_recipe 'httpd::install'
include_recipe 'httpd::configuration'
include_recipe 'httpd::service'
