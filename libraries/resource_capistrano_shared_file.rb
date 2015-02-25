#
# Cookbook Name:: capistrano-base
# Resource:: capistrano_shared_file
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
      attribute :app_root, kind_of: String, required: true
      attribute :owner, kind_of: String, default: 'deploy'
      attribute :group, kind_of: String, default: 'deploy'
      attribute :variables, kind_of: Hash, default: {}

      def shared_directory
        "#{app_root}/shared"
      end

      def target_file
        "#{shared_directory}/#{file}"
      end
    end
  end
end
