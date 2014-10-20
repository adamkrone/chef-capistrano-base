#
# Cookbook Name:: capistrano-base
# Recipe:: apache2
#
# Copyright (C) 2014
#
#
#

node.normal['apache']['user'] = node['capistrano_base']['deployment_user']
node.normal['apache']['group'] = node['capistrano_base']['deployment_group']
node.normal['apache']['mpm'] = 'event'

include_recipe 'apache2::default'
