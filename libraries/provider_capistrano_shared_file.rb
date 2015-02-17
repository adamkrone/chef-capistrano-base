#
# Cookbook Name:: capistrano-base
# Provider:: capistrano_shared_file
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
