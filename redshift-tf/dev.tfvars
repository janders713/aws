#set provider
aws_region = "us-east-2"

#create VPC
vpc_cidr = "10.0.0.0/16"


#subnets
redshift_subnet_cidr_1 = "10.0.1.0/24"
redshift_subnet_cidr_2 = "10.0.2.0/24"

#Redshift Cluster
rs_cluster_identifier = "sample-cluster"
rs_database_name = "samplecluster"
rs_master_username = "sampleuser"
rs_master_pass = "jga372680"
rs_nodetype = "dc2.large"
rs_cluster_type = "single-node"