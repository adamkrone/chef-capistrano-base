#
# Cookbook Name:: capistrano-base
# Recipe:: database-mysql
#
# Copyright (C) 2014
#
#
#

mysql_root = Chef::DataBagItem.load('mysql', 'root')

capistrano_mysql node['capistrano_base']['db']['name'] do
  mysql_root_password mysql_root['password']
  db_user node['capistrano_base']['db']['user']
  db_password node['capistrano_base']['db']['user_password']
  db_environments node['capistrano_base']['db']['environments']
end
