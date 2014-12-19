require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class CapistranoMysqlDatabase < Chef::Resource::LWRPBase
      self.resource_name = :capistrano_mysql_database
      actions :create, :delete
      default_action :create

      attribute :environment, kind_of: String, name_attribute: true
      attribute :app_name, kind_of: String, required: true
      attribute :user, kind_of: String, required: true
      attribute :user_host, kind_of: String, default: 'localhost'
      attribute :user_password, kind_of: String, required: true
      attribute :mysql_root_password, kind_of: String, required: true
    end

    def mysql_connection_info
      { host:     'localhost',
	username: 'root',
	password: mysql_root_password }
    end

    def database_name
      "#{app_name}_#{environment}"
    end
  end
end
