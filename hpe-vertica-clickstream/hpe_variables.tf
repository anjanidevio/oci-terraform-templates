variable "tenancy_ocid" {
   default = "ocid1.tenancy.oc1..aaaaaaaaa4jvtf7x54iv54vz77ivqui2nlb7ordznpupnvqbaktl6vkwfhga"
}

variable "user_ocid" {
     default = "ocid1.user.oc1..aaaaaaaat5pk2vhfib7bnf6n3bqsw2mjlieisfv4yfjtw5xvrkwpvvhkiloq"
}

variable "fingerprint" {
   default ="71:ea:80:93:a1:92:f8:32:85:05:66:b2:9e:fe:74:40"
}

variable "private_key_url" {
    default = "C:/Users/komalio/AppData/Roaming/obmcpvt.pem"
}

variable "region" {
    default = "us-phoenix-1"
}

variable "compartment_id" {
    default = "ocid1.compartment.oc1..aaaaaaaajgefvmehc6szlyyt66aiu6ecefhr7myrn32w2c5prxng5mq3wu7q"
}
variable "HPEvcnCIDR" {
  default = "10.0.0.0/24"
}

variable "VcnDisplayName" {
  default = "HPEVertica"
}

variable "VcnDnsLabel" {
  default = "vcnHPE"
}

variable "ssh_public_key" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAt6uRj/htFEsnALv9WUAEpIIDOt2+RMeis3x/PWWDaNAO0PAU5GSrXOGbELPqA9Us3tq6nMUXN5XjqYHKqq4Hm7SxJrC95DagDCvD/RKiqq3H3b/oz7CQrtp99xn/sfibPKrUufrnaXW8rb9U71+FPVP3RoIebMNnyA1Fxs2nOR3sbTG7R824SRbmJs2XhLJyU3JEVvLl7SZNfZ10ilswrPa4qmd5H5ixFPij2ocsEQX6Q/thjI7e2OU557jvUkG20L5Bc3XInRvOEPW0i06N8vbWYiQGXl5LdKbXjb5QHz3vpbUCPF11n583LyHU3LzNL4IMSinsLuysQb4KeGFhFQ== rsa-key-20171108"
}
variable "InstanceOS" {
    default = "CentOS"
}

variable "InstanceOSVersion" {
    default = "6.9"
}
variable "InstanceShape" {
    default = "VM.Standard1.8"
}
variable "DBSize" {
  default = "262144" 
}
variable "BootStrapFile" {
   default = "./userdata/enablepassword.sh"
}
variable "ssh_private_key" {

    default = "./userdata/hpe_private.pem"

}
 variable "admin_username" {
     default = "dbadmin"
 }