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
  path "#{node['capistrano_base']['app_deploy_root']}/shared"
  template '.env.erb'
  variables template_variables
  owner node['capistrano_base']['deployment_user']
  group node['capistrano_base']['deployment_group']
end
