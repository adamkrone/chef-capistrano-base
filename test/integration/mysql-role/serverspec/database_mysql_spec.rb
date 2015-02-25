require 'serverspec'

set :backend, :exec

describe 'Database MySQL' do
  describe command(
    'mysql -u root -pmy-root-password -D mysql -e "select User from user" | grep my-app'
  ) do
    its(:exit_status) { should eq 0 }
  end

  describe command(
    'mysql -u root -pmy-root-password -e "show databases" | grep my_app_production'
  ) do
    its(:exit_status) { should eq 0 }
  end
end
