require 'serverspec'

set :backend, :exec

describe 'App' do
  describe file('/etc/apache2/sites-available/my-app.conf') do
    it { should be_file }
    it { should contain 'DocumentRoot /var/www/my-app/current' }
  end

  describe file('/etc/apache2/sites-enabled/my-app.conf') do
    it { should be_file }
  end

  describe file('/var/www') do
    it { should be_owned_by 'deploy' }
    it { should be_grouped_into 'deploy' }
  end

  describe file('/var/www/my-app') do
    it { should be_directory }
    it { should be_owned_by 'deploy' }
    it { should be_grouped_into 'deploy' }
  end

  describe file('/var/www/my-app/shared') do
    it { should be_directory }
    it { should be_owned_by 'deploy' }
    it { should be_grouped_into 'deploy' }
  end
end
