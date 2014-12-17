require 'spec_helper'

describe 'capistrano-base::mysql_server' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  before do
    stub_command("\"/usr/bin/mysql\" -u root -e 'show databases;'")
      .and_return('app_production')
  end

  it 'should include the mysql::server recipe' do
    expect(chef_run).to include_recipe('mysql::server')
  end
end
