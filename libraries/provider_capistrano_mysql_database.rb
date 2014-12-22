require 'chef/provider/lwrp_base'

class Chef
  class Provider
    class CapistranoMysqlDatabase < Chef::Provider::LWRPBase
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :create do
        recipe_eval do
          run_context.include_recipe 'database::mysql'
        end

        mysql_database_user new_resource.user do
          connection new_resource.mysql_connection_info
          password new_resource.user_password
          host new_resource.user_host
          action :create
        end

        Chef::Log.info("Creating database: #{new_resource.database_name}")

        mysql_database new_resource.database_name do
          connection new_resource.mysql_connection_info
          action :create
        end

        mysql_database_user new_resource.user do
          connection new_resource.mysql_connection_info
          database_name new_resource.database_name
          privileges [:all]
          action :grant
        end
      end

      action :delete do
        recipe_eval do
          run_context.include_recipe 'database::mysql'
        end

        mysql_database new_resource.database_name do
          action :delete
        end

        mysql_database_user new_resource.user do
          action :delete
        end
      end
    end
  end
end
