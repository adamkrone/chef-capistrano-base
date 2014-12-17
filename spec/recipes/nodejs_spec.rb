require 'spec_helper'

describe 'capistrano-base::nodejs' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'should include the nodejs::default recipe' do
    expect(chef_run).to include_recipe('nodejs::default')
  end
end
