This folder contains scripts to build and deploy the sample applications to Bluemix.


* #### watson-bluemix-cf  
   This script deploys the sample application to Cloud Foundry on Bluemix. The script first pulls the *ibmjava:8-maven* image and
   then uses this image to build the application. It then pushes the build application to Bluemix using CF Java Buildpack with IBM java.
 
 * #### watson-bluemix-container
   This scripts deploys the sample application to Docker Single Container on Bluemix. The script first pulls the *ibmjava:8-maven* 
   image and then uses this image to build the application. It then builds a image of the application locally, using the *Dockerfile* in the *sample*
   folder. The *Dockerfile* uses *alpine* as the base image and then adds *IBM Small Footprint JRE* and *tomcat* and finally adds the build sample
   application on top of it. The image is then pushed to *IBM Bluemix Container Registry* and then a container is started using this image.

 * #### watson-bluemix-kubernetes
   This scripts deploys the sample application to Kubernetes clusters on Bluemix. Before executing the script run `bx cs cluster-create --name watson-springboot` command to create a cluster, the creation of cluster can take upto 20 minutes. The script first builds the image of the application locally and then pushes it to the *IBM Bluemix Container Registry*. It then configures the cluster and creates a *Kubernetes deployment* using the image of the application and finally the deployment is exposed as *NodePort service* so that it is applicable to the outside world. 
