#!/usr/bin/env bash
set -e

cd ~

sudo chef-apply --help
sudo chef-apply -e "package 'nano'"
which nano
sudo chef-apply -e "package 'vim'"
which vim
sudo chef-apply -e "package 'emacs'"
which emacs

echo "file 'hello.txt' do
  content 'Hello, world!'
end
" > ~/hello.rb

sudo chef-apply hello.rb
cat hello.txt

echo "file 'hello.txt' do
  content 'Hello, world!'
  mode '0644'
  owner 'root'
  group 'root'
  action :create
end
" > ~/hello.rb

sudo chef-apply hello.rb

echo "package 'nano'
package 'vim'
package 'emacs'

package 'tree'

file '/etc/motd' do
  content 'Property of ...'
end

" > ~/setup.rb

sudo chef-apply setup.rb
