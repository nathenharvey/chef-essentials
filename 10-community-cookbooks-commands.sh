#!/usr/bin/env bash
set -e

#
# This script turns off apache and then proceeds to generate
# a wrapper cookbook like the learner does. It does so on the remote
# instance so it is not exactly the same as what the learner experiences
# but it at least ensures that the instance will work with the contents
# of the cookbook
#

# DISABLE APACHE
sudo service httpd stop

cd ~
chef generate cookbook cookbooks/myhaproxy

echo "name             'myhaproxy'
maintainer       'The Authors'
maintainer_email 'you@example.com'
license          'all_rights'
description      'Installs/Configures myhaproxy'
long_description 'Installs/Configures myhaproxy'
version          '0.1.0'

depends 'haproxy', '~> 1.6.6'

" > ~/cookbooks/myhaproxy/metadata.rb

echo "

node.default['haproxy']['members'] = [{
    'hostname' => 'ec2-52-8-71-11.us-west-1.compute.amazonaws.com',
    'ipaddress' => '52.8.71.11',
    'port' => 80,
    'ssl_port' => 80
  }]

include_recipe 'haproxy::default'

" > ~/cookbooks/myhaproxy/recipes/default.rb

cd ~/cookbooks/myhaproxy
berks install
# berks upload
cd ~
cp -R ~/.berkshelf/cookbooks/build-essential-2.2.4 cookbooks/build-essential
cp -R ~/.berkshelf/cookbooks/cpu-0.2.0 cookbooks/cpu
cp -R ~/.berkshelf/cookbooks/haproxy-1.6.6 cookbooks/haproxy

sudo chef-client --local-mode -r "recipe[myhaproxy]"
