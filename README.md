# capistrano-base

[![Latest Version](http://img.shields.io/github/release/thirdwavellc/chef-capistrano-base.svg?style=flat-square)][release]
[![Build Status](http://img.shields.io/travis-ci/thirdwavellc/chef-capistrano-base.svg?branch=master&style=flat-square)][build]
[![Coverage Status](https://img.shields.io/coveralls/thirdwavellc/chef-capistrano-base.svg?style=flat-square)][coverage]

[release]: https://github.com/thirdwavellc/chef-capistrano-base/releases
[build]: https://travis-ci.org/thirdwavellc/chef-capistrano-base
[coverage]: https://coveralls.io/r/thirdwavellc/chef-capistrano-base

Installs and configures the basic elements needed for Capistrano deployment.

We currently assume that Apache is the web server. This may be configurable in
the future, however we are keeping things simple for the moment.

## LWRPs

This cookbook is intended to be consumed through its LWRPs, and therefore
doesn't include any recipes. Here is an overview of the LWRPs provided:

**Note:** The first attribute listed for each LWRP is also the name attribute.

### capistrano_app

**Attributes:**

| Name             | Description                                    | Type   | Required | Default            |
| ---------------- | ---------------------------------------------- | ------ | -------- | ----------         |
| app_name         | Name of the application.                       | String | true     | N/A                |
| cookbook         | Cookbook that contains web config template.    | String | false    | 'capistrano-base'  |
| template         | Name of the web config template.               | String | false    | 'web_app.conf.erb' |
| deploy_root      | Directory where all applications are deployed. | String | false    | '/var/www'         |
| deployment_user  | User that deploys the application.             | String | false    | 'deploy'           |
| deployment_group | Group that deploys the application.            | String | false    | 'deploy'           |
| server_name      | ServerName in Apache config.                   | String | true     | N/A                |
| server_aliases   | List of ServerAlias in Apache config.          | Array  | false    | nil                |

**Example:**

```ruby
capistrano_app 'my-app' do
  server_name 'my-app.com'
end
```

### capistrano_mysql_database

**Attributes:**

| Name                | Description                                     | Type   | Required | Default     |
| ------------------- | ----------------------------------------------- | ------ | -------- | ----------- |
| db_name             | Name of MySQL database.                         | String | true     | N/A         |
| user                | MySQL User that owns the database.              | String | true     | N/A         |
| user_host           | Host the database is on.                        | String | false    | 'localhost' |
| user_password       | Password for MySQL user that owns the database. | String | true     | N/A         |
| mysql_root_password | Password for MySQL root user.                   | String | true     | N/A         |

**Example:**

```ruby
capistrano_mysql_database 'my_app_production' do
  user 'my-app'
  user_password 'my-app-password'
  mysql_root_password 'my-root-password'
end
```

### capistrano_shared_file

**Attributes:**

| Name      | Description                                | Type   | Required | Default    |
| --------- | ------------------------------------------ | ------ | -------- | ---------- |
| file      | The shared file's name                     | String | true     | N/A        |
| cookbook  | Cookbook that contains the file's template | String | false    | nil        |
| template  | Template used for the file                 | String | true     | N/A        |
| app_root  | The root directory for the app.            | String | true     | N/A        |
| owner     | User that owns the file                    | String | false    | 'deploy'   |
| group     | Group that owns the file                   | String | false    | 'deploy'   |
| variables | Variables to be passed into template       | Hash   | false    | Empty Hash |

**Example:**

```ruby
capistrano_shared_file '.env' do
  app_root '/var/www/my-app'
  template '.env.erb'
end
```

### capistrano_user

**Attributes:**

| Name     | Default                            | Type    | Required | Default |
| -------- | ---------------------------------- | ------- | -------- | ------- |
| name     | Name of the deployment user.       | String  | true     | N/A     |
| group    | Group for the deployment user.     | String  | false    | nil     |
| group_id | Group ID for the deployment group. | Integer | true     | N/A     |

If a group is not provided, it defaults to the user's name.

**Example:**

```ruby
capistrano_user 'deploy' do
  group_id 3000
  action :create
end
```
