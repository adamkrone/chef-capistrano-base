#
# Cookbook Name:: capistrano-base
# Provider:: capistrano_mysql_database
#
# Copyright 2014 Adam Krone <adam.krone@thirdwavellc.com>
# Copyright 2014 Thirdwave, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'chef/provider/lwrp_base'

class Chef
  class Provider
    class CapistranoMysqlDatabase < Chef::Provider::LWRPBase
      include Chef::DSL::IncludeRecipe
      use_inline_resources if defined?(use_inline_resources)
      provides :capistrano_mysql_database

      def whyrun_supported?
        true
      end

      action :create do
        mysql_database_user new_resource.user do
          connection new_resource.mysql_connection_info
          password new_resource.user_password
          host new_resource.user_host
          action :create
        end

        Chef::Log.info("Creating database: #{new_resource.db_name}")

        mysql_database new_resource.db_name do
          connection new_resource.mysql_connection_info
          action :create
        end

        mysql_database_user new_resource.user do
          connection new_resource.mysql_connection_info
          database_name new_resource.db_name
          privileges [:all]
          action :grant
        end
      end

      action :delete do
        mysql_database new_resource.db_name do
          action :delete
        end

        mysql_database_user new_resource.user do
          action :delete
        end
      end
    end
  end
end
