variable "tenancy_ocid" {
     default ="ocid1.tenancy.oc1..aaaaaaaaa4jvtf7x54iv54vz77ivqui2nlb7ordznpupnvqbaktl6vkwfhga"
}

variable "user_ocid" {
    default ="ocid1.user.oc1..aaaaaaaaj6sylt65tk3fcdkwa2qlodgh7mzwd2olhcfmrisdy5vew6qqh4nq"
}

variable "fingerprint" {
    default ="fc:e3:0c:86:ac:62:9c:a3:62:18:fb:79:0f:f7:2e:10" 
}

variable "private_key_url" {
    default = "/root/.oci/oci_api_key1.pem"
}

variable "region" {
    default = "us-ashburn-1"
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
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAv03W+dhSLiPMKj9iOTa9kC5um7KhCLy9LUbslswbNVydtU+EVWLa4aRhe5giwBKbEiPaEu1iiuq/9lp+DGNh4D5YONQioi7eyXJxzfqCiQhHyJKuQNE6PhAcYb6UyC1RotrUKDilHUMWlDXdJwW8k49oSd4dlQsLKdzAB470RcOgCBnHwMefS15ZDbgRCbWCxva/voxzroAK3xLm"
}
variable "InstanceOS" {
    default = "CentOS"
}

variable "InstanceOSVersion" {
    default = "7"
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
