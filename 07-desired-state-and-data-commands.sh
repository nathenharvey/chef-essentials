#!/usr/bin/env bash
set -e

#
chef --help
chef generate --help
chef generate template --help
cd ~
chef generate templates cookbooks/apache index.html
tree cookbooks/apache/templates

echo "<html>
  <body>
    <h1>Hello, world!</h1>
    <h2>ipaddress: <%= node['ipaddress'] %></h2>
    <h2>hostname: <%= node['hostname'] %></h2>
</body>
</html>
" > ~/cookbooks/apache/templates/default/index.html.erb

echo "
package 'httpd'

template '/var/www/html/index.html' do
  source 'index.html.erb'
end

service 'httpd' do
  action [ :enable, :start ]
end
" > ~/cookbooks/apache/recipes/server.rb

$ tree cookbooks/apache/templates/default

# Validate Apache

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
version          '0.2.1'
" > ~/cookbooks/apache/metadata.rb

cd ~/cookbooks/apache
git add .
git status
git commit -m "Changed file resource to template resource and defined a template"


# Workstation Exercise

cd ~
chef generate template cookbooks/workstation motd
echo "Property of ...

  IPADDRESS: <%= node[\"ipaddress\"] %>
  HOSTNAME : <%= node[\"hostname\"] %>
  MEMORY   : <%= node[\"memory\"][\"total\"] %>
  CPU      : <%= node[\"cpu\"][\"0\"][\"mhz\"] %>
" > ~/cookbooks/workstation/templates/default/motd.erb

echo "package 'nano'
package 'vim'
package 'emacs'

package 'tree'
package 'git'

template '/etc/motd' do
  source 'motd.erb'
  mode '0644'
  owner 'root'
  group 'root'
end
" > ~/cookbooks/workstation/recipes/setup.rb

cd ~/cookbooks/workstation
kitchen test
cd ~
sudo chef-client --local-mode -r "recipe[workstation]"
