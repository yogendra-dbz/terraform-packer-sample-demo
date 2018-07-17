#!/bin/bash

DATABASE_NAME=$1
DATABASE_PASS=$2
echo "#----- MySQL 5.6 or greater" | sudo tee -a /etc/opt/jfrog/artifactory/storage.properties
echo "type=mysql" | sudo tee -a /etc/opt/jfrog/artifactory/storage.properties
echo "driver=com.mysql.jdbc.Driver" | sudo tee -a /etc/opt/jfrog/artifactory/storage.properties
echo "url=jdbc:mysql://localhost:3306/$DATABASE_NAME?characterEncoding=UTF-8&elideSetAutoCommits=true" | sudo tee -a /etc/opt/jfrog/artifactory/storage.properties
echo "username=$DATABASE_NAME" | sudo tee -a /etc/opt/jfrog/artifactory/storage.properties
echo "password=$DATABASE_PASS" | sudo tee -a /etc/opt/jfrog/artifactory/storage.properties
