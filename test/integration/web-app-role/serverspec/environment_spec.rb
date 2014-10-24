require 'serverspec'

set :backend, :exec

describe "Environment" do
  describe file('/var/www/shared/.env') do
    it { should be_file }
  end
end
