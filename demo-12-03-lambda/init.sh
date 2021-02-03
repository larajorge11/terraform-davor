#!/bin/bash
set -eo pipefail
PAYLOAD='"MYSTRING"'
FUNCTION='HandlerRequestObject'
cd ~/Documents/courses/java/HandlerRequestObj
export PATH=$PATH:/opt/apache-maven/bin
mvn clean package
cd ~/Documents/courses/terraform/demo-12-03-lambda
cp ~/Documents/courses/java/HandlerRequestObj/target/HandlerRequestObj-1.0.0-SNAPSHOT.zip ~/Documents/courses/terraform/demo-12-03-lambda

terraform apply -auto-approve