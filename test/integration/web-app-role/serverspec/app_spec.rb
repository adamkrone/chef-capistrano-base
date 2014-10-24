require 'serverspec'

set :backend, :exec

describe "App" do
  describe file('/etc/apache2/sites-available/app.conf') do
    it { should be_file }
    it { should contain 'DocumentRoot /var/www/current' }
  end

  describe file('/etc/apache2/sites-enabled/app.conf') do
    it { should be_file }
  end

  describe file('/var/www') do
    it { should be_owned_by 'deploy' }
    it { should be_grouped_into 'deploy' }
  end

  describe file('/var/www/shared') do
    it { should be_directory }
    it { should be_owned_by 'deploy' }
    it { should be_grouped_into 'deploy' }
  end
end
