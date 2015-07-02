#
# Cookbook Name:: chef-frontend
# Recipe:: base
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Install nodejs if true
if node['chef-frontend']['install_nodejs']
  include_recipe "nodejs::nodejs_from_source"
end

# Clone the repo into a directory
git "#{node['chef-frontend']['app']['repository']['name']}_repo" do
  repository node['chef-frontend']['app']['repository']['git_url']
  revision node['chef-frontend']['app']['repository']['revision']
  destination node['chef-frontend']['app']['directory']
  ssh_wrapper node['chef-frontend']['app']['repository']['git_ssh'] if node['chef-frontend']['app']['repository']['git_ssh']
  user node['chef-frontend']['user']
  action :sync
end

# Run npm install as a user and download dependency
execute 'NPM Install' do
  command 'npm install'
  cwd node['chef-frontend']['app']['directory']
  environment 'HOME' => node['chef-frontend']['home'], 'USER' => node['chef-frontend']['user']
  user node['chef-frontend']['user']
end

# Run bower install to get bower componets
execute 'Bower Install' do
  command 'bower install'
  cwd node['chef-frontend']['app']['directory']
  environment 'HOME' => node['chef-frontend']['home'], 'USER' => node['chef-frontend']['user']
  user node['chef-frontend']['user']
end

# Run the gulp task to build the project
execute 'Gulp Build' do
  command node['chef-frontend']['app']['gulp_build_task']
  cwd node['chef-frontend']['app']['directory']
  environment 'HOME' => node['chef-frontend']['home'], 'USER' => node['chef-frontend']['user']
  user node['chef-frontend']['user']
end

