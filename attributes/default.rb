###########
#System Info
node.default['chef-frontend']['user'] = 'root'
node.default['chef-frontend']['home'] = '/'

###########

###########
#Node Setup

node.default['chef-frontend']['install_nodejs'] = true
node.default['chef-frontend']['nodejs']['version'] = '0.12.3'
node.default['chef-frontend']['nodejs']['url'] = 'https://nodejs.org/dist/v0.12.3/node-v0.12.3.tar.gz'
node.default['chef-frontend']['nodejs']['checksum'] = 'e65d83c6f2c874e28f65c5e192ac0acd2bbb52bfcf9d77e33442d6765a3eb9da'

# These are the default values If want to change anything just override all of these
node.override['nodejs']['install_method'] = 'source'
node.override['nodejs']['version'] = node['chef-frontend']['nodejs']['version']
node.override['nodejs']['source']['url'] = node['chef-frontend']['nodejs']['url']
node.override['nodejs']['source']['checksum'] = node['chef-frontend']['nodejs']['checksum']


###########

###########
#App

#Git
node.default['chef-frontend']['app']['repository']['name'] = ''
node.default['chef-frontend']['app']['repository']['git_url'] = ''
node.default['chef-frontend']['app']['repository']['revision'] = 'HEAD'
node.default['chef-frontend']['app']['repository']['git_ssh_key'] = nil

node.default['chef-frontend']['app']['directory'] = '/' + ['chef-frontend']['app']['repository']['name']

#Build Dependency
node.default['chef-frontend']['app']['gulp_build_task'] = ''
node.default['chef-frontend']['app']['build_folder_in_app'] = ''

###########

###########
#More App Setup

#NPM

node.default['chef-frontend']['global_npm_packages'] = ['gulp', 'bower']
###########
