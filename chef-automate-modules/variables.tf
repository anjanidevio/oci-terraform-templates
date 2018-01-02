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
variable "Vcn-CIDR" {
  default = "10.0.0.0/16"
}

variable "DisplayName" {
  default = "chef"
}

variable "VCN-DNSLabel" {
  default = "vcnchef"
}

variable "ssh_public_key" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAoI3G2NvBStynJXG6cXPuT8PlzJVVHUd8v7mAbK2E+d4kdm0pt/1VMWfA5p0UMaLw6vG0ZxEqUoDObHHV18cTTDG95CXXDgiM5mMPepXgeQZpG+TxJ5NJq+Z4IwPt0q6W0L9AYFCg50b7BhO3S/jngYY74kh4T63gNJ/OlUzL8hnOT93Cq+XNBrAZZdzC/k2nqLxJfM/l5EccYGnaGkdm34C4JCacRKTb43CDK9JXe3n7SrahsfeybYWsxfw69gwNj0fxwzPUDeyEsprjqZEjGGR3H58gmFe3+2TN7Bmv6TZK2H3W4EU0yQpWoPpYz0oDmyHHbf3/Ia8Vhgqg0rV3UQ== rsa-key-20171110"
}
variable "InstanceOS" {
    default = "Canonical Ubuntu"
}

variable "InstanceOSVersion" {
    default = "16.04"
}
variable "winInstanceOS" {
    default = "Windows"
}

variable "winInstanceOSVersion" {
    default = "Server 2012 R2 Standard"
}
variable "InstanceShape" {
    default = "VM.Standard1.4"
}
variable "BootStrapFile" {
   default = "./userdata/enablepassword.sh"
}

variable "ssh_private_key" {
    default = "./userdata/ssh_private_key.pem"
}
variable "admin_username" {
    default = "chefuser"
}
variable "admin_password" {
    default = "Password@1234"
}
