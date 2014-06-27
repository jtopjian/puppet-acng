#!/bin/bash
apt-get update
apt-get install -y puppet git
gem install r10k
cd /vagrant/puppet
r10k --verbose 3 puppetfile install
