#
# Cookbook Name:: capistrano-base
# Provider:: capistrano_app
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
    class CapistranoApp < Chef::Provider::LWRPBase
      include Chef::DSL::IncludeRecipe
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :create do
        node.normal['apache']['docroot_dir'] = '/var/www'
        node.normal['apache']['user'] = new_resource.deployment_user
        node.normal['apache']['group'] = new_resource.deployment_group
        include_recipe 'apache2::default'

        service 'apache2'

        directory new_resource.deploy_root do
          owner new_resource.deployment_user
          group new_resource.deployment_group
          recursive true
          action :create
        end

        params_cookbook = new_resource.web_app_cookbook
        params_template = new_resource.web_app_template
        params_docroot = new_resource.docroot
        params_server_name = new_resource.server_name
        params_server_aliases = new_resource.server_aliases

        web_app new_resource.name do
          cookbook params_cookbook if params_cookbook
          template params_template
          docroot params_docroot
          server_name params_server_name if params_server_name
          server_aliases params_server_aliases if params_server_aliases
        end
      end

      action :delete do
        directory new_resource.deploy_root do
          recursive true
          action :delete
        end

        web_app new_resource.deploy_root do
          enable false
        end
      end
    end
  end
end
