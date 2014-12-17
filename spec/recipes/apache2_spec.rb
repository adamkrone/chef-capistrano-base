require 'spec_helper'

describe 'capistrano-base::apache2' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  before do
    stub_command('/usr/sbin/apache2 -t').and_return(true)
  end

  it 'should include the apache2::default recipe' do
    expect(chef_run).to include_recipe('apache2::default')
  end
end
