This folder contains the source files of the sample application built using Spring MVC web framework.
   
The application can be build using either *Maven* or *Gradle*.  
   
   In case of *Maven* **pom.xml** is used to build the application and then use  `cf push -f maven_manifest.yml` to push the application to Bluemix.
   
   In case of *Gradle* **build.gradle** is used to build the application and then use `cf push -f gradle_manifest.yml` to push the application to Bluemix.
   
