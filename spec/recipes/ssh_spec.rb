require 'spec_helper'

describe 'capistrano-base::ssh' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'should include the ssh-hardening::default recipe' do
    expect(chef_run).to include_recipe('ssh-hardening::default')
  end
end