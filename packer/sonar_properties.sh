#!/bin/bash

DATABASE_NAME=$1
DATABASE_PASS=$2
echo "#----- MySQL 5.6 or greater" | sudo tee -a /opt/sonar/conf/sonar.properties
echo "sonar.jdbc.username=$DATABASE_NAME" | sudo tee -a /opt/sonar/conf/sonar.properties
echo "sonar.jdbc.password=$DATABASE_PASS" | sudo tee -a /opt/sonar/conf/sonar.properties
echo "sonar.jdbc.url=jdbc:mysql://localhost:3306/$DATABASE_NAME?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useConfigs=maxPerformance&useSSL=false" | sudo tee -a /opt/sonar/conf/sonar.properties
