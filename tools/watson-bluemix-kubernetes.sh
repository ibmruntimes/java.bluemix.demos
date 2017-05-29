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

pushd ../samples/watson-springboot

echo "building the app using maven"
docker run -v $PWD:/opt/myapp -w /opt/myapp -it --rm ibmcom/ibmjava:8-maven mvn package

popd

echo "creating image from the dockerfile"
docker build -t registry.ng.bluemix.net/ibmtest01/watson-springboot ../samples

# bx login -a https://api.ng.bluemix.net

bx cr login

echo "pushing the image to bluemix"
docker push registry.ng.bluemix.net/ibmtest01/watson-springboot

# bx cs init

# bx cs cluster-create --name watson-springboot

bx cs workers watson-springboot

echo "setting cluster configuration"
var=`bx cs cluster-config watson-springboot`
env_val=`echo $var | sed -E "s/^.*\. export/export/"`
$env_val

echo "creating a Kubernetes deployment"
kubectl run watson-springboot-deployment --image=registry.ng.bluemix.net/ibmtest01/watson-springboot

echo "exposing the deployment as a NodePort service"
kubectl expose deployment/watson-springboot-deployment --type=NodePort --port=8080 --name=watson-springboot-service

port=$(kubectl describe service watson-springboot-service | grep -i "NodePort:" | sed -E "s/^.*>[[:space:]]//" | sed "s/\/TCP//")

ip=$(bx cs workers watson-springboot | awk '{print $2}' | tail -1)

add="Visit http://${ip}:$port after few minutes to access the app."

echo $add


