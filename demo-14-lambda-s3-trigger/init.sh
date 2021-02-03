#!/bin/bash
set -eo pipefail
cd ~/Documents/courses/java/InventoryData
export PATH=$PATH:/opt/apache-maven/bin
mvn clean package
cd ~/Documents/courses/terraform/demo-14-lambda-s3-trigger
cp ~/Documents/courses/java/InventoryData/target/InventoryData-1.0.0-SNAPSHOT.zip ~/Documents/courses/terraform/demo-14-lambda-s3-trigger

terraform apply -auto-approve