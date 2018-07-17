# Azure Detail
client_id=""
client_secret=""
tenant_id=""
subscription_id=""
admin_username="adminis"
admin_password="Password1234"
resource_group=""
vm_size="Standard_DS1_v2"


#AWS Detail
aws_access_key_id=""
aws_secret_access_key=""
aws_security_token="afasdf#ads2fe234343erra3form"
aws_region="us-east-1"
owner="052578464564"

#Datadog
datadog_api_key=""
datadog_app_key=""

#Jenkins Detail
is_jenkins_req="Y"   #use "Y/N" to provision jenkins or not, default is "N"
jenkins_instance_type="t2.medium"


#Sonarqube Detail
is_sonarqube_req="Y"   #use "Y/N" to provision sonarqube or not, default is "N"
sonarqube_instance_type="t2.medium"


#Jfrog Artifactory Detail
is_jfrog_req="Y"   #use "Y/N" to provision jfrog artifactory or not, default is "N"
jfrog_instance_type="t2.medium"

#WebServer Detail
is_webserver_req="Y" #use "Y/N" to provision WebServer or not, default is "N"
ami-webserver.us-east-1="ami-a4dc46db"
webserver_instance_type="t2.medium"
webserver_availability_zone="us-east-1a"


#Database Server Detail
is_database_vm_req="Y" #use "Y/N" to provision database or not, default is "N"
ami-database.us-east-1="ami-a4dc46db"
database_instance_type="t2.medium"

#Nat Server Detail
is_nat_req="Y" #use "Y/N" to provision Nat Instance or not, default is "N"
amis-nat.us-east-1="ami-8d7655f7"   # Do not change this value
nat_availability_zone="us-east-1a"
nat_instance_type="t2.small"  # Do not change this value