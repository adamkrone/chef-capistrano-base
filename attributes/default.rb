#
# Cookbook Name:: capistrano-base
# Attributes:: default
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

default['capistrano_base']['app_name'] = 'app'
default['capistrano_base']['app_deploy_root'] = '/var/www'
default['capistrano_base']['app_docroot'] = '/var/www/current'
default['capistrano_base']['app_template'] = 'web_app.conf.erb'
default['capistrano_base']['environment'] = 'production'
default['capistrano_base']['deployment_user'] = 'deploy'
default['capistrano_base']['deployment_group'] = 'deploy'
default['capistrano_base']['deployment_group_id'] = 3000

default['capistrano_base']['db']['name'] = 'app'
default['capistrano_base']['db']['user'] = 'deploy'
default['capistrano_base']['db']['user_password'] = 'deploy'
default['capistrano_base']['db']['environments'] = ['production']
default['capistrano_base']['db']['host'] = 'localhost'

default['capistrano_base']['env_variables'] = {}
