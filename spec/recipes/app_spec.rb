require 'spec_helper'

describe 'capistrano-base::app' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  before do
    stub_command('/usr/sbin/apache2 -t').and_return(true)
  end

  it 'should create the /var/www/app directory' do
    expect(chef_run).to create_directory('/var/www')
  end

  it 'should include the apache2::default recipe' do
    expect(chef_run).to include_recipe('apache2::default')
  end

  it 'should include the apache2::mod_rewrite recipe' do
    expect(chef_run).to include_recipe('apache2::mod_rewrite')
  end

  it 'should include the apache2::mod_deflate recipe' do
    expect(chef_run).to include_recipe('apache2::mod_deflate')
  end

  it 'should include the apache2::mod_headers recipe' do
    expect(chef_run).to include_recipe('apache2::mod_headers')
  end

  it 'should create the /etc/apache2/sites-enabled/app.conf template' do
    expect(chef_run).to create_template('/etc/apache2/sites-available/app.conf')
  end
end
