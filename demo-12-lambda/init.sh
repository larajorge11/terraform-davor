#!/bin/bash
set -eo pipefail
PAYLOAD='"MYSTRING"'
FUNCTION='HandlerString'
cd ~/Documents/courses/java/HandlerString
export PATH=$PATH:/opt/apache-maven/bin
mvn clean package
cd ~/Documents/courses/terraform/demo-12-lambda
cp ~/Documents/courses/java/HandlerString/target/demo-1.0.0.zip ~/Documents/courses/terraform/demo-12-lambda
mv demo-1.0.0.zip demo19890806.zip
terraform apply -auto-approve

while true; do
    if [ $PAYLOAD ]
    then
        aws lambda invoke --function-name $FUNCTION --payload $PAYLOAD out.json
    fi
    cat out.json
    echo ""
    sleep 2
done