#
# Cookbook Name:: chef-frontend
# Recipe:: global_npm_packages
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#This will install all global npm packages
node['chef-frontend']['global_npm_packages'].each do |package|
  nodejs_npm package
end
