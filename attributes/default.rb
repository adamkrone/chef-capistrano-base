default['capistrano_base']['app_name'] = 'app'
default['capistrano_base']['app_deploy_root'] = '/var/www'
default['capistrano_base']['app_docroot'] = '/var/www/current'
default['capistrano_base']['app_template'] = 'app.conf.erb'
default['capistrano_base']['environment'] = 'production'
default['capistrano_base']['deployment_user'] = 'deploy'
default['capistrano_base']['deployment_group'] = 'deploy'

default['capistrano_base']['db']['name'] = 'app'
default['capistrano_base']['db']['user'] = 'deploy'
default['capistrano_base']['db']['user_password'] = 'deploy'
default['capistrano_base']['db']['environments'] = ['development', 'staging', 'production']
default['capistrano_base']['db']['host'] = 'localhost'

default['capistrano_base']['env_variables'] = {}
