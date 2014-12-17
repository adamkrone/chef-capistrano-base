require 'serverspec'

set :backend, :exec

describe 'Apache2' do
  describe package('apache2') do
    it { should be_installed }
  end

  describe service('apache2') do
    it { should be_enabled }
    it { should be_running }
  end
end
