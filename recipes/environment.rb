#
# Cookbook Name:: capistrano-base
# Recipe:: environment
#
# Copyright (C) 2014
#
#
#

template_variables = {
  environment_variables: node['capistrano_base']['env_variables']
}

capistrano_shared_file '.env' do
  template '.env.erb'
  deploy_root node['capistrano_base']['app_deploy_root']
  owner node['capistrano_base']['deployment_user']
  group node['capistrano_base']['deployment_group']
  variables template_variables
end
