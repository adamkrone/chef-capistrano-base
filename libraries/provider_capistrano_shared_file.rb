require 'chef/provider/lwrp_base'

class Chef
  class Provider
    class CapistranoSharedFile < Chef::Provider::LWRPBase
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :create do
        directory new_resource.shared_directory do
          owner new_resource.owner
          group new_resource.group
          action :create
        end

        template new_resource.target_file do
          cookbook new_resource.cookbook if new_resource.cookbook
          source new_resource.template
          owner new_resource.owner
          group new_resource.group
          variables(new_resource.variables)
          action :create
        end
      end

      action :delete do
        template new_resource.file_template do
          action :delete
        end
      end
    end
  end
end
