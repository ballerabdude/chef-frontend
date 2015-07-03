#
# Cookbook Name:: chef-frontend
# Recipe:: default
#
# Copyright 2015, Abdul Hagi
# Authors:
#       Abdul Hagi <muridiv.1@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install nodejs if true
if node['chef-frontend']['install_nodejs']
  include_recipe "nodejs::nodejs_from_source"
end

#This will install all global npm packages
node['chef-frontend']['global_npm_packages'].each do |package|
  nodejs_npm package
end

# Clone the repo into a directory
git "#{node['chef-frontend']['app']['repository']['name']}_repo" do
  repository node['chef-frontend']['app']['repository']['git_url']
  revision node['chef-frontend']['app']['repository']['revision']
  destination node['chef-frontend']['app']['directory']
  ssh_wrapper node['chef-frontend']['app']['repository']['git_ssh_key'] if node['chef-frontend']['app']['repository']['git_ssh_key']
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
