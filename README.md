# Automate-Swagger-Changes
A bash script to send message to slack channel when their is a change happens in the swagger api

## Prerequisites
1. Install jq command
```
sudo apt-get install jq
```

## Run the script
```
./autoDetection.sh 'directory' 'swagger_api' 'swagger_pages_list' 'slack_api'
```
1. directory: is a directory to contain the downloaded swagger pages
2. swagger_api: is http://ip:port/ that hosts the swagger api
3. swagger_pages_list: list of the swagger api pages
4. slack_api: the webhook url used to send the slack message [Follow this link to create webhook url](https://api.slack.com/messaging/webhooks)

## Example on running the script
Let's say empty directory is /home/user/Desktop/swagger/ 

The swagger apis are:
1. http://127.0.0.1:7070/page-1-api/swagger-ui/
2. http://127.0.0.1:7070/page-2-api/swagger-ui/
3. http://127.0.0.1:7070/page-3-api/swagger-ui/
4. http://127.0.0.1:7070/page-4-api/swagger-ui/

The slack api is
https://hooks.slack.com/services/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

The command should be
```
./autoDetection.sh '/home/user/Desktop/swagger/' 'http://127.0.0.1:7070/' ('page-1-api' 'page-2-api' 'page-3-api' 'page-4-api') https://hooks.slack.com/services/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
``` 
## Automate the script
