require 'spec_helper'

describe 'capistrano-base::environment' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'should create the shared directory' do
    expect(chef_run).to create_directory('/var/www/shared')
  end

  it 'should create the /var/www/shared/.env template' do
    expect(chef_run).to create_template('/var/www/shared/.env')
  end
end
