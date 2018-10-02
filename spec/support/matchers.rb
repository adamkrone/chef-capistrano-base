def create_web_app(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:web_app, :create, resource_name)
end

def create_users_manage(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:users_manage, :create, resource_name)
end

def install_sudo(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:sudo, :install, resource_name)
end
