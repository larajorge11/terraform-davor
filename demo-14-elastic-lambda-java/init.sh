#!/bin/bash
set -eo pipefail
cd ~/Documents/courses/java/InventoryData
export PATH=$PATH:/opt/apache-maven/bin
mvn clean package
cd ~/Documents/courses/terraform/demo-14-elastic-lambda-java
cp ~/Documents/courses/java/InventoryData/target/InventoryData-1.0.0-SNAPSHOT.zip ~/Documents/courses/terraform/demo-14-elastic-lambda-java

terraform apply -auto-approve