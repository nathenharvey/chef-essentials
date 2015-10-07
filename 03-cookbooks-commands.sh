#!/usr/bin/env bash
set -e

cd ~
echo "package 'nano'
package 'vim'
package 'emacs'

package 'tree'
package 'git'

file '/etc/motd' do
  content 'Property of ...'
  mode '0644'
  owner 'root'
  group 'root'
end


" > setup.rb
sudo chef-apply setup.rb
chef --help
chef generate --help
chef generate cookbook --help
chef generate cookbook workstation
tree workstation
cat workstation/metadata.rb
cat workstation/recipes/default.rb
mv setup.rb workstation/recipes/setup.rb
cd workstation
git init
git add .
git status
git commit -m "Initial workstation cookbook"
cd ~
chef generate cookbook apache
echo "
package 'httpd'

file '/var/www/html/index.html' do
  content '<h1>Hello, world!</h1>'
end

service 'httpd' do
  action [ :enable, :start ]
end
" > ~/apache/recipes/server.rb
sudo chef-apply apache/recipes/server.rb
curl localhost
cd apache
git init
git add .
git commit -m "Initial Apache Cookbook"
