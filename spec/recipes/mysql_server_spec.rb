require 'spec_helper'

describe 'capistrano-base-test::mysql_server' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['mysql']['server_debian_password'] = 'my-root-password'
      node.set['mysql']['server_root_password'] = 'my-root-password'
      node.set['mysql']['server_repl_password'] = 'my-root-password'
    end.converge(described_recipe)
  end

  before do
    stub_command("\"/usr/bin/mysql\" -u root -e 'show databases;'")
      .and_return('app_production')
  end

  it 'should include the mysql::server recipe' do
    expect(chef_run).to include_recipe('mysql::server')
  end
end
