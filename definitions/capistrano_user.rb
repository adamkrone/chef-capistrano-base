#
# Cookbook Name:: capistrano-base
# Definition:: capistrano_user
#
# Copyright (C) 2014
#
#
#

define :capistrano_user do
  include_recipe 'users'

  users_manage params[:name] do
    group_name params[:group]
    group_id params[:group_id]
    action :create
  end

  sudo params[:name] do
    user params[:name]
    group params[:group]
    nopasswd true
  end
end
