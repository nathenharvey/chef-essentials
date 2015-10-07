#!/usr/bin/env bash
set -e

hostname -I
ifconfig
hostname
cat /proc/meminfo
cat /proc/cpuinfo

echo "
package 'nano'
package 'vim'
package 'emacs'

package 'tree'
package 'git'

file \"/etc/motd\" do
  content \"Property of ...

  IPADDRESS: HARDCODED VALUE
  HOSTNAME : HARDCODED VALUE
  MEMORY   : HARDCODED VALUE
  CPU      : HARDCODED VALUE
\"
  mode '0644'
  owner 'root'
  group 'root'
end
" > ~/cookbooks/workstation/recipes/setup.rb

cd ~/coobooks/workstation
kitchen test
cd ~
sudo chef-client --local-mode -r "recipe[workstation]"
cat /etc/motd

#

ohai

echo "
package 'nano'
package 'vim'
package 'emacs'

package 'tree'
package 'git'

file \"/etc/motd\" do
  content \"Property of ...

  IPADDRESS: #{node['ipaddress']}
  HOSTNAME : #{node['hostname']}
  MEMORY   : #{node['memory']['total']}
  CPU      : #{node['cpu']['0']['mhz']}
\"
  mode '0644'
  owner 'root'
  group 'root'
end
" > ~/cookbooks/workstation/recipes/setup.rb

cd ~/cookbooks/workstation
kitchen test
cd ~
sudo chef-client --local-mode -r "recipe[workstation]"


# Cookbook Versioning

echo "name             'workstation'
maintainer       'The Authors'
maintainer_email 'you@example.com'
license          'all_rights'
description      'Installs/Configures workstation'
long_description 'Installs/Configures workstation'
version          '0.2.0'
" > ~/cookbooks/workstation/metadata.rb

cd ~/cookbooks/workstation
git add .
git status
git commit -m "Version 0.2.0 - Added Node Details in MOTD"


# Apache Exercise

echo "
package 'httpd'

file '/var/www/html/index.html' do
  content \"<h1>Hello, world\!</h1>
  <h2>ipaddress: #{node['ipaddress']}</h2>
<h2>hostname: #{node['hostname']}</h2>
\"
end

service 'httpd' do
  action [ :enable, :start ]
end
" > ~/cookbooks/apache/recipes/server.rb



cd ~/cookbooks/apache
kitchen test
cd ~
sudo chef-client --local-mode -r "recipe[apache]"
echo "name             'apache'
maintainer       'The Authors'
maintainer_email 'you@example.com'
license          'all_rights'
description      'Installs/Configures apache'
long_description 'Installs/Configures apache'
version          '0.2.0'
" > ~/cookbooks/apache/metadata.rb

cd ~/cookbooks/apache
git add .
git status
git commit -m "Version 0.2.0 - Added Node Details in Index Page"
