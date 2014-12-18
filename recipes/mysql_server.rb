#
# Cookbook Name:: capistrano-base
# Recipe:: mysql-server
#
# Copyright (C) 2014
#
#
#

mysql_root = Chef::DataBagItem.load('mysql', 'root')

mysql_service 'default' do
  bind_address '0.0.0.0'
  port '3306'
  version '5.5'
  initial_root_password mysql_root['password']
  action [:create, :start]
end
