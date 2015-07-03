# chef-frontend-cookbook

This cookbook automate you app deployment. All you need to do is override the node required attributes for this cookbook and you will have a fully automated deployment.

## Supported Platforms

Tested on ubuntu 14.04

## Attributes

| Key                                                         |Required Override|Type     |Description                                                                                            | Default                                                         |
| :-----------------------------------------------------------|:---------------:|:-------:|:----------------------------------------------------------------------------------------:             |:---------------------------------------------------------------:|
| `['chef-frontend']['user']`                                 |                 |String   |The name of the user running the app                                                                   |root                                                             |
| `['chef-frontend']['home']`                                 |                 |String   |The user's --^ home location                                                                           | /                                                               |
| `['chef-frontend']['install_nodejs']`                       |                 |Boolean  |Should this cookbook install NodeJs for you? **Will install using the source**                         |true                                                             |
| `node['chef-frontend']['nodejs']['version']`                |                 |String   |Which version of NodeJs should be installed                                                            |0.12.3                                                           |
| `node['chef-frontend']['nodejs']['url']`                    |                 |String   |The url to the source                                                                                  |https://nodejs.org/dist/v0.12.3/node-v0.12.3.tar.gz              |
| `node['chef-frontend']['nodejs']['checksum']`               |                 |String   |source checksum                                                                                        |e65d83c6f2c874e28f65c5e192ac0acd2bbb52bfcf9d77e33442d6765a3eb9da |
| `['chef-frontend']['app']['directory']`                     |                 |String   |Where will the app live                                                                                |'/' + ['chef-frontend']['app']['repository']['name']             |
| `['chef-frontend']['app']['repository']['name']`            |*                |String   |The app name from the repo                                                                             |''                                                               |
| `['chef-frontend']['app']['repository']['git_url']`         |*                |String   |Repo Url **Use git protocall not https** set location of private key if its a private repo             |''                                                               |
| `['chef-frontend']['app']['repository']['revision']`        |*                |String   |Git revision                                                                                           |HEAD                                                             |
| `['chef-frontend']['app']['repository']['git_ssh_key']`     |                 |String   |SSH key location to use for git. http://stackoverflow.com/questions/20470076/git-authentication-in-chef|''                                                               |
| `node['chef-frontend']['app']['gulp_build_task']`           |                 |String   |What gulp task should be run to build the app                                                          |''                                                               |
| `node['chef-frontend']['app']['build_folder_in_app']`       |                 |String   |The build folder for the app                                                                           |''                                                               |
| `node['chef-frontend']['global_npm_packages']`              |                 |[String] |Packages needed to build app                                                                           |['gulp', 'bower']                                                |

## Usage

Set the required node overrides and your app will be built.

## Order of cookbook

1. Check to see if it needs to install node
2. Install global npm packages
3. Pull the repo into `['chef-frontend']['app']['directory']`
4. `npm install` inside of the app root folder
5. `bower install` inside of the app root folder
6. run `node['chef-frontend']['app']['gulp_build_task']` inside the app root folder

### chef-frontend::default

Include `chef-frontend` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[chef-frontend::default]"
  ]
}
```

## License and Authors

Author:: Abdul Hagi (muridiv.1@gmail.com)
