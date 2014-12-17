require 'spec_helper'

describe 'capistrano-base::mysql-server' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'should include the mysql::server recipe' do
    expect(chef_run).to include_recipe('mysql::server')
  end
end
