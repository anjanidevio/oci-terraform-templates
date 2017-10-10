# Terraform variables

variable "tenancy_ocid" {
    default = ""
}

variable "user_ocid" {
    default = ""
}

variable "fingerprint" {
    default = ""
}

variable "private_key_path" {
    default = "./obmcpvt.pem"
}

variable "region" {
    default = "us-ashburn-1"
}

variable "compartment_id" {
    default = ""
}

variable "ssh_public_key" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAtybP5Ud490SHPp/JORglAwD682F6t+0ry4Kn2lakGXt7dnepdjlj4FtO4YMd9HBl8WJ5fz4xL1NjUBt/9qpIGnPBLLByU0T7jeh5R6NblcrEYDOgX0eh4mCZxs1f5ldOXuLWUuExsSv3XewarBtWkZqnatS1XIj7flJa6Vv+OkMiFprAt7bw9p4aKH4X/zlv9gf6+Xw38DyPIMN73/pCA9OBkp1Mwzk64u5NpwzivW8FD2KFvuzTtj+YPPstZFEA1XKT25xWK5E5rl3LeZ7gAhowaXQ9ajLNkQF9BFONsyNzdFd+qn0elG5ORDH24yqYlpxmR8uEi+YrRAgqLWF+0w== rsa-key-20170925"
}

variable "InstanceOS" {
    default = "Oracle Linux"
}

variable "InstanceOSVersion" {
    default = "7.3"
}

variable "DSE_Shape" {
    default = "VM.DenseIO1.8"
#   default = "VM.DenseIO1.16"
}

variable "OPSC_BASE_IMAGE_ID" {
    default = ""
}

variable "OPSC_Shape" {
    default = "VM.Standard1.8"
}

variable "2TB" {
    default = "2097152"
}

variable "host_user_name" {
    default = "opc"
}

variable "OPSC_BootStrap" {
    default = "./userdata/lcm_opscenter_userdata.sh"
}

variable "DSE_BootStrap" {
    default = "./userdata/lcm_node_userdata.sh"
}

# DSE cluster name
variable "DSE_Cluster_Name" {
   default = "JumpStart"
}

# DataStax Academy Credentials for DSE software download
variable "DataStax_Academy_Creds" {
  type = "map"
  default = {
    username = "datastax@oracle.com"
    password = "Ashpassword123"
  }
}

# Collect #nodes in each AD from a user
# This value has always to be 1 for Jump Start
variable "Num_DSE_Nodes_In_Each_AD" {
   default = "1"
}

# Collect user provided password for "cassandra" superuser
# The cassandra user's password has to be "datastax1!" for Jump Start
variable "Cassandra_DB_User_Password" {
   default = "datastax1!"
}

