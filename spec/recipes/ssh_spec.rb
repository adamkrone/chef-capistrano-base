require 'spec_helper'

describe 'capistrano-base-test::ssh' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'should include the ssh-hardening::default recipe' do
    expect(chef_run).to include_recipe('ssh-hardening::default')
  end
end
