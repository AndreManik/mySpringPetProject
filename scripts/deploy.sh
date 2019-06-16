#!/bin/bash

mvn clean package

echo "Copy files..."

scp target/sweater-1.0-SNAPSHOT.jar \
    andre@192.168.88.130:/sweater/

echo "Restart server..."

ssh andre@192.168.88.130 << EOF

pgrep java | xargs kill -9
nohup sudo $JAVA_HOME\bin\java -jar sweater-1.0-SNAPSHOT.jar > log.txt &

EOF