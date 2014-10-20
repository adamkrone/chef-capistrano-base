#
# Cookbook Name:: capistrano-base
# Recipe:: app
#
# Copyright (C) 2014
#
#
#

web_app node['capistrano_base']['app_name'] do
  template node['capistrano_base']['app_template']
  docroot node['capistrano_base']['app_docroot']
end
