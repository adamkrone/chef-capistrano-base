require 'spec_helper'

describe 'capistrano-base::web_app_role' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  before do
    stub_command('/usr/sbin/apache2 -t').and_return(true)
  end

  it 'should include the apt::default recipe' do
    expect(chef_run).to include_recipe('apt::default')
  end

  it 'should include the capistrano-base::user recipe' do
    expect(chef_run).to include_recipe('capistrano-base::user')
  end

  it 'should include the capistrano-base::ssh recipe' do
    expect(chef_run).to include_recipe('capistrano-base::ssh')
  end

  xit 'should include the capistrano-base::apache2 recipe' do
    expect(chef_run).to include_recipe('capistrano-base::apache2')
  end

  it 'should include the capistrano-base::app recipe' do
    expect(chef_run).to include_recipe('capistrano-base::app')
  end

  it 'should include the capistrano-base::environment recipe' do
    expect(chef_run).to include_recipe('capistrano-base::environment')
  end
end
