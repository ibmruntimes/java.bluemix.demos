This folder contains example scripts to build and deploy the sample applications to Bluemix. We are using **watson-springboot** sample application built using **Maven** as an example in the scripts, similarly other sample applications can also be built using either **Maven** or **Gradle** and deployed to bluemix. 

Note: Before running any scripts follow the instruction in README of sample folders and obtain the credentials for the Watson Services.

These demos assume that you have a Blumix account and the following installed on your system (Links with instructions to install are also provided.):
Docker : https://docs.docker.com/engine/installation/
CF CLI : https://github.com/cloudfoundry/cli#downloads
IBM-Containers Plugin : Use the command <bx plugin install IBM-Containers -r Bluemix>
Bluemix CLI : https://clis.ng.bluemix.net/ui/home.html


 * #### watson-bluemix-cf
   This script deploys the sample application to Cloud Foundry on Bluemix. The script first pulls the *ibmjava:8-maven* image and then uses this image to build the application. It then pushes the build application to Bluemix using CF Java Buildpack with IBM java. Before running the script move into the `sample/watson-springboot` directory  and open `maven_manifest.yml` file with a text editor and edit the following values with the credential obtained by you:<br/>
- `FACEAPIKEY: <api_key>`
- `TEXTPASSWORD: <password>`
- `TEXTUSERNAME: <username>`
 
 * #### watson-bluemix-container
   This scripts deploys the sample application to IBM Bluemix Container Service on Bluemix. The script first pulls the *ibmjava:8-maven* image and then uses this image to build the application. It then builds a image of the application locally using the *Dockerfile* in the *sample* folder. The *Dockerfile* uses *sjf-alpine* as the base image and then adds *tomcat* and finally adds the build sample application on top of it. The image is then pushed to *IBM Bluemix Container Registry* and then a container is started using this image. Before running the script move into the `sample` directory  and open `Dockerfile` with a text editor and edit the following values with the credential obtained by you:<br/>
- `FACEAPIKEY= <api_key>\`
- `TEXTPASSWORD= <password>\`
- `TEXTUSERNAME= <username>`

 * #### watson-bluemix-kubernetes
   This scripts deploys the sample application to Kubernetes clusters on Bluemix. The script first builds the image of the application locally and then pushes it to the *IBM Bluemix Container Registry*. It then configures the cluster and creates a *Kubernetes deployment* using the image of the application and finally the deployment is exposed as *NodePort service* so that it is applicable to the outside world.Before running the script move into the `sample` directory  and open `Dockerfile` with a text editor and edit the following values with the credential obtained by you:<br/>
- `FACEAPIKEY= <api_key>\`
- `TEXTPASSWORD= <password>\`
- `TEXTUSERNAME= <username>`
Now run the following commands to create a cluster (the creation of cluster can take upto 20 minutes).
1. `bx login`
2. `bx cs init`
3. `bx cs cluster-create --name watson-springboot`

