# Description
Deploy [Bedrock/Sage](https://roots.io) based Wordpress project to a shared hosting (or any other that you have ssh access to) using [Gitlab's CI](https://docs.gitlab.com/ee/ci/).

## How to use?
0. Add [SSH_PRIVATE_KEY variable in Gitlab's settings](https://docs.gitlab.com/ee/ci/ssh_keys/) and make sure it works (connecting to the server without password). 
1. edit variables on top of the .gitlab-ci.yml 
2. edit variables on top of the deploy.sh
3. edit branches to run deployments on (["only:"](https://docs.gitlab.com/ee/ci/yaml/#onlyexcept-basic) sections in .gitlab-ci.yml)
4. make sure you have [Runners](https://docs.gitlab.com/runner/) set up in gitlab
5. commit & push both files (in root of your project) and watch the script work.

#### Use at your own risk.

In general:

- Always backup 1st
- Always understand what you are about to do
- Enjoy
