require_relative 'spec_helper'

describe file('/etc/apt/apt.conf.d/01apt-cacher-ng-proxy') do
  it { should be_file }
  its(:content) { should match /^Acquire::http.*example.com:3142/ }
end
