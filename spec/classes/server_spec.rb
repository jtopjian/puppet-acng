require 'spec_helper'

describe 'acng::server' do

  let :params do
    {
      :ensure => 'present',
      :enable => 'true',
    }
    end

  it { should contain_package('apt-cacher-ng') }

  it do
    should contain_service('apt-cacher-ng').with({
      :ensure => 'present',
      :enable => 'true',
    }).that_requires('Package[apt-cacher-ng]')
  end

end
