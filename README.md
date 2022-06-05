# Automate-Swagger-Changes
A bash script to send message to slack channel when their is a change happens in the swagger api

## Prerequisites
1. Install jq command
```
sudo apt-get install jq
```

## Run the script
```
autoDetection.sh 'directory' 'swagger_api' 'slack_api'
```
1. directory: is a directory to contain the downloaded swagger pages
2. swagger_api: is http://ip:port/ that hosts the swagger api
3. slack_api: the webhook url used to send the slack message [Follow this link to create webhook url](https://api.slack.com/messaging/webhooks)

## Example on running the script

## Automate the script
