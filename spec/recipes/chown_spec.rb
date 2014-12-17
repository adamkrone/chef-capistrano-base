require 'spec_helper'

describe 'capistrano-base::chown' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'should create the /var/www directory' do
    expect(chef_run).to create_directory('/var/www').with(owner: 'deploy',
                                                          group: 'deploy',
                                                          recursive: true)
  end
end
