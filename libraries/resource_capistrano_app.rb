require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class CapistranoApp < Chef::Resource::LWRPBase
      self.resource_name = :capistrano_app
      actions :create, :delete
      default_action :create

      attribute :app_name, kind_of: String, name_attribute: true
      attribute :cookbook, kind_of: String, default: nil
      attribute :template, kind_of: String, default: nil
      attribute :deploy_root, kind_of: String, required: true
      attribute :docroot, kind_of: String, required: true
      attribute :deployment_user, kind_of: String, default: 'deploy'
      attribute :deployment_group, kind_of: String, default: 'deploy'
      attribute :server_name, kind_of: String, default: nil
      attribute :server_aliases, kind_of: Array, default: []
      attribute :apache_mpm, kind_of: String, default: nil

      def web_app_cookbook
        return cookbook if cookbook
        return 'capistrano-base' unless template
        nil
      end

      def web_app_template
        return template if template
        'web_app.conf.erb'
      end
    end
  end
end
