require 'spec_helper'

describe 'acng::client' do

  it do
    should contain_file('/etc/apt/apt.conf.d/01apt-cacher-ng-proxy').with({
      :ensure  => 'present',
      :owner   => 'root',
      :group   => 'root',
      :mode    => '0644',
      :content => /localhost:3142/,
    })
  end
end
