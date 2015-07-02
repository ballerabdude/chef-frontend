###########
#System Info
node.default['chef-frontend']['user'] = 'root'
node.default['chef-frontend']['home'] = '/'

###########

###########
#Node Setup

node.default['chef-frontend']['install_node'] = true

# These are the default values If want to change anything just override all of these
node.override['nodejs']['install_method'] = 'source'
node.override['nodejs']['version'] = '0.12.3'
node.override['nodejs']['source']['url'] = 'https://nodejs.org/dist/v0.12.3/node-v0.12.3.tar.gz'
node.override['nodejs']['source']['checksum'] = 'e65d83c6f2c874e28f65c5e192ac0acd2bbb52bfcf9d77e33442d6765a3eb9da'


###########

###########
#App

node.default['chef-frontend']['app']['directory'] = ''

#Git
node.default['chef-frontend']['app']['repository']['name'] = ''
node.default['chef-frontend']['app']['repository']['git_url'] = ''
node.default['chef-frontend']['app']['repository']['revision'] = 'HEAD'
node.default['chef-frontend']['app']['repository']['git_ssh'] = nil

#Build Dependency
node.default['chef-frontend']['app']['gulp_build_task'] = ''
node.default['chef-frontend']['app']['build_folder_in_app'] = ''

node.default['chef-frontend']['project_init_commends'] = ''
###########

###########
#More App Setup

#NPM

node.default['chef-frontend']['global_npm_packages'] = []
###########
