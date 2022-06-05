#! /bin/bash

### You should Replace **...** to the real data

home_dir='/home/**user**/Desktop/**folder_created_on_desktop**/'
swagger_api='http://**swagger_api**:**swagger_port**/'
slack_api='**slack_webhook_url**'


########################## APIs ##########################
apis=("**swagger_page1**" "**swagger_page2**" "**swagger_page3**")


########################## Compine Files in Lists ##########################
allDir=()
allSwagger=()
allApi=()
for api in ${apis[@]}; do
	dir="${home_dir}${api}/"
	[ -d $dir ] || mkdir $dir
	allDir+=($dir)
	allSwagger+=("${swagger_api}${api}/swagger-ui/")
	allApi+=("${swagger_api}${api}/api-docs")
done


########################## Loop on the list and Detect changes ##########################
for i in ${!allDir[@]}; do
	########################## Download the website ##########################
  wget ${allApi[$i]}  > /dev/null 2>&1

	mv api-docs ${allDir[$i]}api-docs-new
	
	########################## Reformat the json ##########################
	jq . ${allDir[$i]}api-docs-new > ${allDir[$i]}api-docs-new.json

	########################## Detect if there is a website change ##########################
	difference=$(diff ${allDir[$i]}api-docs.json ${allDir[$i]}api-docs-new.json)
	#echo $difference

	########################## Replace some special characters to a space ##########################
	difference=${difference//[:|\"|<|>|\{]/ }
	#echo $difference

	rm ${allDir[$i]}api-docs.json ${allDir[$i]}api-docs-new
	mv ${allDir[$i]}api-docs-new.json ${allDir[$i]}api-docs.json	
	
	swagger=${allSwagger[$i]}
	
	########################## Send a message to the slack channel ##########################
	[ ! -z "$difference" ] && curl -X POST -H 'Content-type: application/json' --data "{\"text\":\" $swagger Changed \n $difference \n\n \"}" ${slack_api}
done
