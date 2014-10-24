require 'serverspec'

set :backend, :exec

describe "Database MySQL" do
  describe command('mysql -u root -pilikerandompasswords -D mysql -e "select User from user" | grep deploy') do
    its(:exit_status) { should eq 0 }
  end

  describe command('mysql -u root -pilikerandompasswords -e "show databases" | grep app_production') do
    its(:exit_status) { should eq 0 }
  end
end
