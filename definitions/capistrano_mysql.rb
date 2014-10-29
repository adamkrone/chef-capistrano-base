#
# Cookbook Name:: capistrano-base
# Definition:: capistrano_mysql
#
# Copyright (C) 2014
#
#
#

define :capistrano_mysql do
  include_recipe 'database::mysql'

  db_name = params[:name]
  db_user = params[:db_user]
  db_user_host = params[:db_user_host] || 'localhost'
  db_password = params[:db_password]
  db_environments = params[:db_environments]

  mysql_connection_info = {
    :host     => 'localhost',
    :username => 'root',
    :password => params[:mysql_root_password]
  }

  mysql_database_user db_user do
    connection mysql_connection_info
    password db_password
    host db_user_host
    action :create
  end

  db_environments.each do |env|
    database_name = "#{db_name}_#{env}"
    Chef::Log.info("Creating database: #{database_name}")

    mysql_database database_name do
      connection mysql_connection_info
      action :create
    end

    mysql_database_user db_user do
      connection mysql_connection_info
      database_name database_name
      privileges [:all]
      action :grant
    end
  end
end
