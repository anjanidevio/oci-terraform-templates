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
    default = "./userdata/obmcpvt.pem"
}

variable "region" {
    default = "us-phoenix-1"
}

variable "compartment_ocid" {
    default = "ocid1.compartment.oc1..aaaaaaaajgefvmehc6szlyyt66aiu6ecefhr7myrn32w2c5prxng5mq3wu7q"
}

variable "prefix" {
    default = "demo"
}

variable "sshPublicKey" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA3MLOkhGaNkLl1gLuExEIoyP6u/1DjbCxGzhLIccEl4UajiNE9yx8ae47+DSKpl9zi6eeI2zyn88VzJ5twkl2hQrTi5T4E36ujS4QbtmCWj1a1hj2dub7STZBkmsYmh5QUz7Nw8wbvkaJy7wrnXJ2bGRGXomyNlpOxMdlFvjeW5mFFQmwyCDpBiqkOi72NpMRfcPF/R1H0uodeqXZf+Xrvw86mz2OtnzXR8sX2r1DXFobm8NycZbhL8HszWadDi7TO9rQvUoRPkc+Q8CgCXi557cVXUbTpdCC/eJviKlKlpgZYem5Uq4wi29Qijm0Ev2EEfMahMgqNQhGagcLRWapZQ== rsa-key-20170306"
}

variable "ssh_private_key" {
    default = "./userdata/docker-td-pvt-key.pem"
}

variable "admin_username" {
    default = "docker"
}

variable "admin_password" {
    default = "Docker2017"
}


variable "instanceShape" {
    default = "VM.Standard1.4"
}

variable "instanceLinOS" {
    default = "Canonical Ubuntu"
}

variable "instanceLinOSVersion" {
    default = "16.04"
}

variable "bootStrapFileDir" {
    default = "./userdata/enable-password-auth-user.sh"
}



