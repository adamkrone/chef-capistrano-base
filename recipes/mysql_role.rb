#
# Cookbook Name:: capistrano-base
# Recipe:: mysql-role
#
# Copyright (C) 2014
#
#
#

include_recipe 'apt::default'
include_recipe 'capistrano-base::user'
include_recipe 'capistrano-base::ssh'
include_recipe 'capistrano-base::mysql_server'
include_recipe 'capistrano-base::database_mysql'
