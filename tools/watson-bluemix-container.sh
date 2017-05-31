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

checkContainerPlugin(){
	if ! bx plugin list |grep -w "IBM-Containers" > /dev/null; then
		echo "IBM-Containers Plugin is not installed. Run bx plugin install IBM-Containers -r Bluemix"
		exit 1
	fi
}

getAppUrl(){
	ip=$(bx ic ip-request)
	ip=$(echo $ip |cut -d\" -f2)
	bx ic ip-bind $ip watson-springboot
	url="visit http://$ip:8080 to access the app after few minutes"
	echo $url
}

rootdir=".."

# git clone https://github.com/ibmruntimes/java.bluemix.demos.git

checkDocker
checkCFCLI
checkBluemixCLI
checkContainerPlugin

pullMavenImage

pushd $rootdir/samples/watson-springboot
mavenCompileApp
popd

echo "creating image from the dockerfile"
docker build -t registry.ng.bluemix.net/ibmtest01/watson-springboot $rootdir/samples

checkLogin
# bx login -a https://api.ng.bluemix.net

# bx ic init

echo "pushing the image to bluemix"
docker push registry.ng.bluemix.net/ibmtest01/watson-springboot

echo "starting the app"
bx ic run -p 8080:8080 --name watson-springboot registry.ng.bluemix.net/ibmtest01/watson-springboot

getAppUrl
