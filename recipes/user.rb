#
# Cookbook Name:: capistrano-user
# Recipe:: user
#
# Copyright (C) 2014
#
#
#

include_recipe 'capistrano-base'

capistrano_user node['capistrano_base']['deployment_user'] do
  group node['capistrano_base']['deployment_group']
  group_id node['capistrano_base']['deployment_group_id']
  action :create
end
