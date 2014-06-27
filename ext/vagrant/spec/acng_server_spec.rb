require_relative 'spec_helper'

describe package('apt-cacher-ng') do
  it { should be_installed }
end

describe service('apt-cacher-ng') do
  it { should be_enabled }
  it { should be_running }
end

describe port(3142) do
  it { should be_listening }
end
