#!/bin/bash

set -x

dockerize() {
	folder="challs/$1"
	name="frictf2022.azurecr.io/challs/$2:latest"
	pushd $folder
	docker build --platform=linux/amd64 -t $name . &&
	docker push $name
	popd
}

dockerize "jswhat" "jswhat"
dockerize "just_werify_it" "just-werify-it"
dockerize "legit" "legit"
dockerize "pop_rdi" "pop-rdi"
dockerize "ret2win" "ret2win"
dockerize "sea_shell" "sea-shell"
dockerize "segfault_handler" "segfault-handler"
dockerize "suspicious_traffic_two" "suspicious-traffic-two"
dockerize "web_burp_demo" "web-burp-demo"
