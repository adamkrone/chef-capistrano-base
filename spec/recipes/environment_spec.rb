require 'spec_helper'

describe 'capistrano-base::environment' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: ['capistrano_shared_file']).converge(described_recipe)
  end

  it 'should create the shared directory' do
    expect(chef_run).to create_directory('/var/www/shared')
  end

  it 'should create the /var/www/shared/.env template' do
    expect(chef_run).to create_template('/var/www/shared/.env')
  end
end
