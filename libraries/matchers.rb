def create_capistrano_app(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:capistrano_app, :create, resource_name)
end

def delete_capistrano_app(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:capistrano_app, :delete, resource_name)
end

def create_capistrano_mysql_database(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:capistrano_mysql_database, :create, resource_name)
end

def delete_capistrano_mysql_database(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:capistrano_mysql_database, :delete, resource_name)
end

def create_capistrano_shared_file(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:capistrano_shared_file, :create, resource_name)
end

def delete_capistrano_shared_file(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:capistrano_shared_file, :delete, resource_name)
end

def create_capistrano_user(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:capistrano_user, :create, resource_name)
end

def delete_capistrano_user(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:capistrano_user, :delete, resource_name)
end
