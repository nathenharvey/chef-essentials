#!/usr/bin/env bash
set -e

cd ~
mkdir cookbooks
mv workstation cookbooks
mv apache cookbooks
sudo chef-client --local-mode -r "recipe[apache::server]"
sudo chef-client --local-mode -r "recipe[workstation::setup]"
sudo chef-client --local-mode \ -r "recipe[apache::server],recipe[workstation::setup]"

echo "#
# Cookbook Name:: workstation
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'workstation::setup'
" > ~/cookbooks/workstation/recipes/default.rb

sudo chef-client --local-mode -r "recipe[workstation]"

echo "#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apache::server'
" > ~/cookbooks/apache/recipes/default.rb

sudo chef-client --local-mode -r "recipe[apache]"
sudo chef-client --local-mode -r "recipe[apache],recipe[workstation]"
