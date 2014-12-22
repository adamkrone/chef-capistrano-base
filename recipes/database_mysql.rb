#
# Cookbook Name:: capistrano-base
# Recipe:: database-mysql
#
# Copyright (C) 2014
#
#
#

node['capistrano_base']['db']['environments'].each do |env|
  capistrano_mysql_database env do
    app_name node['capistrano_base']['app_name']
    mysql_root_password node['mysql']['server_root_password']
    user node['capistrano_base']['db']['user']
    user_password node['capistrano_base']['db']['user_password']
  end
end
