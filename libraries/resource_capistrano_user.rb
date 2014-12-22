require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class CapistranoUser < Chef::Resource::LWRPBase
      self.resource_name = :capistrano_user
      actions :create, :delete
      default_action :create

      attribute :name, kind_of: String, name_attribute: true
      attribute :group, kind_of: String, default: nil
      attribute :group_id, kind_of: Integer, required: true

      def group_name
        return group if group
        name
      end
    end
  end
end
