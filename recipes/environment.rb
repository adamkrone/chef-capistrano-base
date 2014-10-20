#
# Cookbook Name:: capistrano-base
# Recipe:: environment
#
# Copyright (C) 2014
#
#
#

directory "#{node['capistrano_base']['app_deploy_root']}/shared" do
  owner node['capistrano_base']['deployment_user']
  group node['capistrano_base']['deployment_group']
  action :create
end

template "#{node['capistrano_base']['app_deploy_root']}/shared/.env" do
  source '.env.erb'
  owner node['capistrano_base']['deployment_user']
  group node['capistrano_base']['deployment_group']
  action :create
end
