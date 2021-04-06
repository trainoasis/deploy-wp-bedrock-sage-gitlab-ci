# Description
Deploy Bedrock/Sage based Wordpress project to a shared hosting (or any other that you have ssh access to) using Gitlab's CI. 

## How to use?
0. Add SSH_PRIVATE_KEY variable in Gitlab's settings and make sure it works (connecting to the server without password). 
1. edit variables on top of the .gitlab-ci.yml 
2. edit variables on top of the deploy.sh
3. edit branches to run deployments on ("only:" sections in .gitlab-ci.yml)
4. make sure you have Runners set up in gitlab
5. commit & push both files (in root of your project) and watch the script work.
