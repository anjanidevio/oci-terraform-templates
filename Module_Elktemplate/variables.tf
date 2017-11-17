variable "tenancy_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaaa4jvtf7x54iv54vz77ivqui2nlb7ordznpupnvqbaktl6vkwfhga"
}

variable "user_ocid" {
    default = "ocid1.user.oc1..aaaaaaaat5pk2vhfib7bnf6n3bqsw2mjlieisfv4yfjtw5xvrkwpvvhkiloq"
}

variable "fingerprint" {
    default = "71:ea:80:93:a1:92:f8:32:85:05:66:b2:9e:fe:74:40"
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
variable "ElkVcn-CIDR" {
  default = "10.0.0.0/16"
}

variable "VCN-DisplayName" {
  default = "ELKvcn"
}

variable "VCN-DNSLabel" {
  default = "vcnELK"
}

variable "ssh_public_key" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAjE5AhJ/YJ1zJJPo7mH8rU7Ieg1F4+6cZ8nK3gv9D1MC/zRMsCWF8YyGRBcWtVSzxcZEO8QWTFJxhfnuWdhXWU5d8Jzzf2j1JjB3UD5eV1OghT6HOJeJm6ofYrspUy9PFigfudYE0ma2cVRpIvsTahFo+io4kgx9yF7ozVKpbe3ZxRATpHu6xiuyI8XG98a1LaqdcjRp/rNApPK1br3rUtdvXKhyRLnCJ1D/U6o9z9eC2CSa5sN3latH8l8eo+BGW9xc33DX8OYmGBTSbHHNclGvjDTyyr6U8yg065sZy1uQ0o/P/UAIUdXnoRl1rn1+FKQlzHldbsRl2c1OhzDw4Iw== rsa-key-20171009"
}
variable "InstanceOS" {
    default = "Canonical Ubuntu"
}

variable "InstanceOSVersion" {
    default = "16.04"
}
variable "InstanceShape" {
    default = "VM.Standard1.4"
}
variable "BootStrapFile" {
   default = "./userdata/enablepassword.sh"
}
variable "BootStrapFile1" {
   default = "./userdata/filebeat_enablepassword.sh"
    }
variable "ssh_private_key" {
    default = "./userdata/elkprivatekey.pem"
}
variable "admin_username" {
    default = "ubuntu"
}
variable "admin_password" {
    default = "elastic@123"
}
