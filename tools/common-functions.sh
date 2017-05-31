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
set -eo pipefail

checkDocker() {
	if ! docker -v | grep -w "version" > /dev/null; then
		echo "Docker is not installed. Follow the instructions at https://docs.docker.com/engine/installation/"
		exit 1
	fi
}

checkCFCLI() {
	if ! cf -v | grep -w "version" > /dev/null; then
		echo "CF CLI is not installed. Follow the instructions at https://github.com/cloudfoundry/cli#downloads"
		exit 1
	fi
}

checkBluemixCLI(){
	if ! bx plugin list |grep -w "IBM-Containers" > /dev/null; then
		echo "Bluemix CLI is not installed. Follow the instructions at https://clis.ng.bluemix.net/ui/home.html"
		exit 1
	fi
}

checkLogin(){
	if ! bx target | grep -w "Account" > /dev/null; then
		echo "Login to bluemix using bx login"
		exit 1
	fi
}

pullMavenImage(){
	echo "pulling the maven image"
	docker pull ibmcom/ibmjava:8-maven
}

mavenCompileApp() {
	echo "building the app using maven"	
	docker run -v $PWD:/opt/myapp -w /opt/myapp -it --rm ibmcom/ibmjava:8-maven mvn package
}

