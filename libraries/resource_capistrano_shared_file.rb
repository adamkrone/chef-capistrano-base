require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class CapistranoSharedFile < Chef::Resource::LWRPBase
      self.resource_name = :capistrano_shared_file
      actions :create, :delete
      default_action :create

      attribute :file, kind_of: String, name_attribute: true
      attribute :cookbook, kind_of: String, default: nil
      attribute :template, kind_of: String, required: true
      attribute :deploy_root, kind_of: String, required: true
      attribute :owner, kind_of: String, default: 'deploy'
      attribute :group, kind_of: String, default: 'deploy'
      attribute :variables, kind_of: Hash, default: {}

      def shared_directory
        "#{deploy_root}/shared"
      end

      def target_file
        "#{shared_directory}/#{file}"
      end
    end
  end
end
