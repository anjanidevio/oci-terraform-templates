variable "tenancy_ocid" {
    default =  ""
}

variable "user_ocid" {
    default = ""
}

variable "fingerprint" {
    default = ""
}

variable "private_key_path" {
    default = "C:/Users/srekapalli/AppData/Roaming/oci_api_keys/ociPrkey.pem"
}

variable "region" {
    default = "us-phoenix-1"
}

variable "compartment_ocid" {
    default = "ocid1.compartment.oc1..aaaaaaaajgefvmehc6szlyyt66aiu6ecefhr7myrn32w2c5prxng5mq3wu7q"
}

variable "prefix" {
    default = "dtsun"
}

variable "sshPublicKey" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAxPvFEyzT4vVr2ex6oABazugBPNsiyERjpBnt7yWW/QnXh5thfAbcKnS0uK9a6JVvHP7JLpzMvp1evL+ycwhuiWZtHcrBRtqWT3tLyoRPLbYXJLF9U+6zsFSiZrinqlsCgwzJJuiJcW/FiG9XOTBsTvGb3txGqOt0c8at+Y0RTvBG7quYMFpJczitfJHZ7zLXaOAe3zEbl6FatsRNXZm+/PZ08eGxJvFtQfufBagWbvehQ6i89cIzClP324S8RfVD7314K/6UHHT1NUCmYo/9amAeCTRKcpGIQWfvLbdBdzwhH2LlyAL+hyPUWxmqLJYvBTc/98oKY/fer0wVbba9/w== rsa-key-20171128"
}

variable "ssh_private_key" {
    default = "./userdata/dtsun-privatekey.pem"
}

variable "admin_username" {
    default = "datasunrise"
}

variable "admin_password" {
    default = "datasunrise@1234"
}

variable "instanceShape" {
    default = "VM.Standard1.4"
}

variable "instanceLinOS" {
    default = "CentOS"
}

variable "instanceLinOSVersion" {
    default = "7"
}

variable "bootStrapFileDir" {
    default = "./userdata/enable-password.sh"
}

variable "postgrePassword" {
    default = "postgre@123"
}

variable "dataSunrise-GUI-Password" {
    default = "datasunrise@123"
}