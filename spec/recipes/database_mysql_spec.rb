require 'spec_helper'

describe 'capistrano-base::database_mysql' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'should include the database::mysql recipe' do
    expect(chef_run).to include_recipe('database::mysql')
  end

  it 'should create the db user' do
    expect(chef_run).to create_mysql_database_user('deploy')
  end

  it 'should create the production db' do
    expect(chef_run).to create_mysql_database('app_production')
  end

  it 'should grant the db user permissions for the production db' do
    expect(chef_run).to grant_mysql_database_user('deploy')
      .with(database_name: 'app_production')
  end
end
