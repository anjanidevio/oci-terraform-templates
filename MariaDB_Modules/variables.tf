variable "tenancy_ocid" {
  
}

variable "user_ocid" {
     
}

variable "fingerprint" {
    
}

variable "private_key_url" {
    default = "./userdata/privatekey.pem"
}

variable "region" {
    default = "us-phoenix-1"
}

variable "compartment_id" {
    default = "ocid1.compartment.oc1..aaaaaaaajgefvmehc6szlyyt66aiu6ecefhr7myrn32w2c5prxng5mq3wu7q"
}
variable "mariadbVcn-CIDR" {
  default = "10.0.0.0/16"
}

variable "VCN-DisplayName" {
  default = "mariadbvcn"
}

variable "VCN-DNSLabel" {
  default = "vcnmariadb"
}

variable "ssh_public_key" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAssqG50nVFljO2QTJnFsZoNGn2P5xhVZynpXHVTgqgeOZa6eYkFgYyHO5pDK87R4MVeLsKO6D9E9/cZfdadfZ9hZLK6T2gV06XOqUywSfVWc2ZcNsXC6xVDFzQYco2n0JOtU1Fz2vXWngbWoOH3bOklVDtajK/ryeASZ3wveeIaEO/X2WbP9dmrCk/C7wsH/MZ0wd0/I9EwDEJOH+ow/P3AzFrOQxX6nnCBccTQna6+Gm3Te8w2x08XN9gN3hvYUokUAsVZW/oQn8W6mSVYIAB3d631UBPDhuWlmszVH1V+G8BYD/pZz3J/BLQmILbfnCIRh6Z65e43v5uBDUHit9OQ== rsa-key-20171205"
}
variable "InstanceOS" {
    default = "Canonical Ubuntu"
}

variable "InstanceOSVersion" {
    default = "16.04"
}
variable "InstanceShape" {
    default = "VM.Standard1.8"
}
variable "BootStrapFile" {
   default = "./userdata/enablepassword.sh"
}
variable "ssh_private_key" {
    default = "./userdata/mariadbprivatekey.pem"
}