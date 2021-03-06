# Description
Deploy [Bedrock/Sage](https://roots.io) based Wordpress project to a shared hosting (or any other that you have ssh access to) using [Gitlab's CI](https://docs.gitlab.com/ee/ci/).

## How to use?
0. Add [SSH_PRIVATE_KEY variable in Gitlab's settings](https://docs.gitlab.com/ee/ci/ssh_keys/) and make sure it works (connecting to the server without password). 
1. edit variables on top of the .gitlab-ci.yml 
2. edit branches to run deployments on (["only:"](https://docs.gitlab.com/ee/ci/yaml/#onlyexcept-basic) sections in .gitlab-ci.yml)
3. make sure you have [Runners](https://docs.gitlab.com/runner/) set up in gitlab
4. commit & push both files (in root of your project) and watch the script work.

## Understanding the deploy.sh script

For more info about the deploy script, check the script README in this repo (which is a repo for the script if you wish to deploy manually):
https://github.com/trainoasis/wp-bedrock-sage-bash-deploy

## Want to build & deploy manually from your local machine rather?

See https://github.com/trainoasis/wp-bedrock-sage-bash-deploy

#### Use at your own risk.

In general:

- Always backup 1st
- Always understand what you are about to do
- Enjoy

