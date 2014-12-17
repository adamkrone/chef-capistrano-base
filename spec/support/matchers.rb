def create_web_app(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:web_app, :create, resource_name)
end

def create_users_manage(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:users_manage, :create, resource_name)
end

def install_sudo(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:sudo, :install, resource_name)
end

def create_mysql_database_user(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:mysql_database_user, :create, resource_name)
end

def create_mysql_database(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:mysql_database, :create, resource_name)
end

def grant_mysql_database_user(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:mysql_database_user, :grant, resource_name)
end
