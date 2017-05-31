#!/bin/bash
#
# (C) Copyright IBM Corporation 2017, 2017
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

tool_dir="$(dirname "$0")"
source "$tool_dir/common-functions.sh"

set -eo pipefail

checkContainerService(){
	if ! bx plugin list |grep -w "container-service" > /dev/null; then
		echo "Container Service Plugin is not installed. Run bx plugin install container-service -r Bluemix"
		exit
	fi
}

checkContainerRegistry(){
	if ! bx plugin list |grep -w "container-registry" > /dev/null; then
		echo "Container Registry Plugin is not installed. Run bx plugin install container-registry -r Bluemix"
		exit
	fi
}

configureCluster(){
	bx cs workers watson-springboot > /dev/null
	echo "setting cluster configuration"
	var=`bx cs cluster-config watson-springboot`
	env_val=`echo $var | sed -E "s/^.*\. export/export/"`
	$env_val
}

getAppUrl(){
	port=$(kubectl describe service watson-springboot-service | grep -i "NodePort:" | sed -E "s/^.*>[[:space:]]//" | sed "s/\/TCP//")
	ip=$(bx cs workers watson-springboot | awk '{print $2}' | tail -1)
	url="Visit http://${ip}:$port after few minutes to access the app."
	echo $url
}

rootdir=".."

# git clone https://github.com/ibmruntimes/java.bluemix.demos.git

checkDocker
checkCFCLI
checkBluemixCLI
checkContainerService
checkContainerRegistry
pullMavenImage
pushd $rootdir/samples/watson-springboot
mavenCompileApp
popd

echo "creating image from the dockerfile"
docker build -t registry.ng.bluemix.net/ibmtest01/watson-springboot $rootdir/samples

checkLogin
# bx login -a https://api.ng.bluemix.net

bx cr login

echo "pushing the image to bluemix"
docker push registry.ng.bluemix.net/ibmtest01/watson-springboot

# bx cs init

# bx cs cluster-create --name watson-springboot

configureCluster

echo "creating a Kubernetes deployment"
kubectl run watson-springboot-deployment --image=registry.ng.bluemix.net/ibmtest01/watson-springboot

echo "exposing the deployment as a NodePort service"
kubectl expose deployment/watson-springboot-deployment --type=NodePort --port=8080 --name=watson-springboot-service

getAppUrl
