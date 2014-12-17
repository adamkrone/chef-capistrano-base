require 'spec_helper'

describe 'capistrano-base::web-app-role' do
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

  it 'should include the capistrano-base::nodejs recipe' do
    expect(chef_run).to include_recipe('capistrano-base::nodejs')
  end

  it 'should include the capistrano-base::apache2 recipe' do
    expect(chef_run).to include_recipe('capistrano-base::apache2')
  end

  it 'should include the capistrano-base::app recipe' do
    expect(chef_run).to include_recipe('capistrano-base::app')
  end

  it 'should include the capistrano-base::environment recipe' do
    expect(chef_run).to include_recipe('capistrano-base::environment')
  end
end
