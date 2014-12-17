require 'spec_helper'

describe 'capistrano-base::mysql-role' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'should include the apt::default recipe' do
    expect(chef_run).to include_recipe('apt::default')
  end

  it 'should include the capistrano-base::user recipe' do
    expect(chef_run).to include_recipe('capistrano-base::user')
  end

  it 'should include the capistrano-base::ssh recipe' do
    expect(chef_run).to include_recipe('capistrano-base::ssh')
  end

  it 'should include the capistrano-base::mysql-server recipe' do
    expect(chef_run).to include_recipe('capistrano-base::mysql-server')
  end

  it 'should include the capistrano-base::database-mysql recipe' do
    expect(chef_run).to include_recipe('capistrano-base::database-mysql')
  end
end
