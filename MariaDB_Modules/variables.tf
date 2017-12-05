variable "tenancy_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaaa4jvtf7x54iv54vz77ivqui2nlb7ordznpupnvqbaktl6vkwfhga"
}

variable "user_ocid" {
     default = "ocid1.user.oc1..aaaaaaaaahytv265dsl4rwlazdxkmbhgsk4mgdivhn3a6mlckcb73ubcsppq"
}

variable "fingerprint" {
    default = "da:7a:d7:11:da:12:84:df:5a:9f:29:0f:79:3b:6f:26"
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
  default = "mariadb"
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
