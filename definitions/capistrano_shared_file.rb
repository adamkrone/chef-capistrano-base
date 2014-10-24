#
# Cookbook Name:: capistrano-base
# Definition:: capistrano_shared_file
#
# Copyright (C) 2014
#
#
#


define :capistrano_shared_file, :variables => {} do

  params[:template] ||= "#{params[:name]}.erb}"

  directory params[:path] do
    owner params[:owner]
    group params[:group]
    action :create
  end

  template "#{params[:path]}/#{params[:name]}" do
    source params[:template]
    owner params[:owner]
    group params[:group]
    variables(params[:variables])
    action :create
  end
end
