#!/usr/bin/env bash
set -e

cd ~
kitchen --help
kitchen help init
tree cookbooks/workstation -a -I .git
cat cookbooks/workstation/.kitchen.yml
cd cookbooks/workstation
echo "---
driver:
  name: docker

provisioner:
  name: chef_zero

platforms:
  - name: centos-6.7

suites:
  - name: default
    run_list:
      - recipe[workstation::default]
    attributes:

" > ~/cookbooks/workstation/.kitchen.yml

kitchen list
kitchen converge

# apache exercise

echo "---
driver:
  name: docker

provisioner:
  name: chef_zero

platforms:
  - name: centos-6.7

suites:
  - name: default
    run_list:
      - recipe[apache::default]
    attributes:

" > ~/cookbooks/apache/.kitchen.yml

cd ~
cd cookbooks/apache
kitchen converge


# Workstation First Test

echo "require 'spec_helper'

describe 'workstation::default' do

  describe package('tree') do
    it { should be_installed }
  end

end
" > ~/cookbooks/workstation/test/integration/default/serverspec/default_spec.rb

cd ~
cd cookbooks/workstation
kitchen verify
cd ~/cookbooks/workstation
git add .
git status
git commit -m "Added first test for the default recipe"


# More workstation Tests

echo "require 'spec_helper'

describe 'workstation::default' do

  describe package('tree') do
    it { should be_installed }
  end

  describe package('git') do
    it { should be_installed }
  end

  describe file('/etc/motd') do
    it { should be_owned_by 'root' }
  end

end
" > ~/cookbooks/workstation/test/integration/default/serverspec/default_spec.rb

cd ~/cookbooks/workstation
kitchen verify
git add .
git status
git commit -m "Added additional tests for default recipe"


# Apache Tests

cd ~
cd cookbooks/apache
echo "require 'spec_helper'

describe 'apache::default' do
  describe port(80) do
    it { should be_listening }
  end

  describe command('curl http://localhost') do
    its(:stdout) { should match /Hello, world\!/ }
  end
end
" > ~/cookbooks/apache/test/integration/default/serverspec/default_spec.rb

kitchen verify
cd ~/cookbooks/apache
git add .
git status
git commit -m "Added tests for the default recipe"
