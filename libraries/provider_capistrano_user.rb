#
# Cookbook Name:: capistrano-base
# Provider:: capistrano_user
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
