require 'serverspec'

set :backend, :exec

describe "MySQL Server" do
  describe service('mysql') do
    it { should be_enabled }
    it { should be_running }
  end
end
