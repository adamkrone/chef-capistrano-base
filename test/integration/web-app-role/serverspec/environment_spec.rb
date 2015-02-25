require 'serverspec'

set :backend, :exec

describe 'Environment' do
  describe file('/var/www/my-app/shared/.env') do
    it { should be_file }
  end
end
