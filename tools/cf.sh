# git clone https://github.com/priyaranjan20/BluemixSampleApp.git

echo "pulling the maven image"
docker pull ibmcom/ibmjava:8-maven

pushd java.bluemix.demos/samples/$1

echo "building the app using maven"
docker run -v $PWD:/opt/myapp -w /opt/myapp -it --rm ibmcom/ibmjava:8-maven mvn package

# cf login

echo "pushing the app"
cf push -f maven_manifest.yml
