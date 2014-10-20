#
# Cookbook Name:: capistrano-base
# Recipe:: web-app-role
#
# Copyright (C) 2014
#
#
#

include_recipe 'apt::default'
include_recipe 'capistrano-base::user'
include_recipe 'capistrano-base::ssh'
include_recipe 'capistrano-base::nodejs'
include_recipe 'capistrano-base::apache2'
include_recipe 'capistrano-base::chown'
include_recipe 'capistrano-base::app'
include_recipe 'capistrano-base::environment'
