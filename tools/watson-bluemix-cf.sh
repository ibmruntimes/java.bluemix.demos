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

# git clone https://github.com/ibmruntimes/java.bluemix.demos.git

echo "pulling the maven image"
docker pull ibmcom/ibmjava:8-maven

pushd java.bluemix.demos/samples/watson-struts2

echo "building the app using maven"
docker run -v $PWD:/opt/myapp -w /opt/myapp -it --rm ibmcom/ibmjava:8-maven mvn package

# cf login -a https://api.ng.bluemix.net

echo "pushing the app"
cf push -f maven_manifest.yml
