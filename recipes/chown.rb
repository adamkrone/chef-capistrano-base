#
# Cookbook Name:: capistrano-base
# Recipe:: chown
#
# Copyright (C) 2014
#
#
#

directory node['apache']['docroot_dir'] do
  owner node['capistrano_base']['deployment_user']
  group node['capistrano_base']['deployment_group']
  recursive true
  action :create
end
