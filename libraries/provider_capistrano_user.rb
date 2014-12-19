require 'chef/provider/lwrp_base'

class Chef
  class Provider
    class CapistranoUser < Chef::Provider::LWRPBase
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
	true
      end

      action :create do
	users_manage new_resource.name do
	  group_name new_resource.group_name
	  group_id new_resource.group_id
	  action :create
	end

	sudo new_resource.name do
	  user new_resource.name
	  group new_resource.group_name
	  nopasswd true
	end
      end

      action :delete do
	user_manage new_resource.name do
	  action :delete
	end

	sudo new_resource.name do
	  action :remove
	end
      end
    end
  end
end
