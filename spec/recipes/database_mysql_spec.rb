require 'spec_helper'

describe 'capistrano-base-test::database_mysql' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: ['capistrano_mysql_database']) do |node|
      node.set['mysql']['server_debian_password'] = 'my-root-password'
      node.set['mysql']['server_root_password'] = 'my-root-password'
      node.set['mysql']['server_repl_password'] = 'my-root-password'
    end.converge(described_recipe)
  end

  it 'should create capistrano_mysql_database[my_app_production]' do
    expect(chef_run).to create_capistrano_mysql_database('my_app_production')
  end

  it 'should include the database::mysql recipe' do
    expect(chef_run).to include_recipe('database::mysql')
  end

  it 'should create the db user' do
    expect(chef_run).to create_mysql_database_user('my-app')
  end

  it 'should create the production db' do
    expect(chef_run).to create_mysql_database('my_app_production')
  end

  it 'should grant the db user permissions for the production db' do
    expect(chef_run).to grant_mysql_database_user('my-app')
      .with(database_name: 'my_app_production')
  end
end
