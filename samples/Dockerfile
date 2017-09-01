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

FROM ibmcom/ibmjava:8-sfj-alpine

MAINTAINER Priyaranjan

ENV TOMCAT_MAJOR=8 \
    TOMCAT_VERSION=8.5.3 \
    TOMCAT_HOME=/opt/tomcat \
    CATALINA_HOME=/opt/tomcat \
    CATALINA_OUT=/dev/null \
    PATH=/opt/tomcat/bin:$PATH

ENV FACEAPIKEY=add_your_key \
    TEXTPASSWORD=add_your_password \
    TEXTUSERNAME=add_your_name

RUN wget -O /tmp/tomcat8.tar.gz https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && cd /opt \
    && tar zxf /tmp/tomcat8.tar.gz \
    && mv /opt/apache-tomcat* /opt/tomcat \
    && rm /tmp/tomcat8.tar.gz \
    && rm -rf /opt/tomcat/webapps/docs /opt/tomcat/webapps/examples /opt/tomcat/webapps/ROOT

ADD watson-springboot/target/watson-springboot-0.0.1-SNAPSHOT.war /opt/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
