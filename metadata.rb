name             'capistrano-base'
maintainer       'Adam Krone'
maintainer_email 'adam.krone@thirdwavellc.com'
license          'Apache v2.0'
description      'Installs/Configures capistrano-base'
long_description 'Installs/Configures capistrano-base'
version          '1.0.0'


depends 'apt'
depends 'users'
depends 'sudo'
depends 'ssh-hardening', '1.0.2'
depends 'nodejs'
depends 'apache2', '~> 3.0'
depends 'mysql', '~> 5.0'
depends 'database', '~> 2.3.1'

issues_url 'https://github.com/thirdwavellc/chef-capistrano-base/issues' if respond_to?(:issues_url)
source_url 'https://github.com/thirdwavellc/chef-capistrano-base' if respond_to?(:source_url)
