#
# Cookbook Name:: capistrano-base
# Definition:: capistrano_app
#
# Copyright (C) 2014
#
#
#

define :capistrano_app do
  params_name = params[:name]
  params_template = params[:template]
  params_deploy_root = params[:deploy_root]
  params_docroot = params[:docroot]
  params_deployment_user = params[:deployment_user]
  params_deployment_group = params[:deployment_group]
  params_server_name = params[:server_name]
  params_server_aliases = params[:server_aliases]

  directory params_deploy_root do
    owner params_deployment_user
    group params_deployment_group
    recursive true
    action :create
  end

  web_app params_name do
    template params_template
    docroot params_docroot
    server_name params_server_name if params_server_name
    server_aliases params_server_aliases if params_server_aliases
  end
end
