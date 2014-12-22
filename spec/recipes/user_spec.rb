require 'spec_helper'

describe 'capistrano-base::user' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: ['capistrano_user']).converge(described_recipe)
  end

  it 'should create the deploy user' do
    expect(chef_run).to create_users_manage('deploy')
      .with(group_id: 'deploy', group_id: 3000)
  end

  it 'should install sudo permissions for the deploy user' do
    expect(chef_run).to install_sudo('deploy')
      .with(user: 'deploy', group: 'deploy', nopasswd: true)
  end
end
