require 'spec_helper'

describe 'acng::server' do

  it { should contain_package('apt-cacher-ng') }

  it do
    should contain_service('apt-cacher-ng').with({
      :ensure => 'running',
      :enable => 'true',
    }).that_requires('Package[apt-cacher-ng]')
  end

end
