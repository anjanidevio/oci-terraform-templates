variable "tenancy_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaaa4jvtf7x54iv54vz77ivqui2nlb7ordznpupnvqbaktl6vkwfhga"
}
variable "user_ocid" {
    default = "ocid1.user.oc1..aaaaaaaaahytv265dsl4rwlazdxkmbhgsk4mgdivhn3a6mlckcb73ubcsppq"
}

variable "fingerprint" {
    default = "da:7a:d7:11:da:12:84:df:5a:9f:29:0f:79:3b:6f:26"
}
variable "compartment_ocid" {
    default = "ocid1.compartment.oc1..aaaaaaaajgefvmehc6szlyyt66aiu6ecefhr7myrn32w2c5prxng5mq3wu7q"
}
variable "InstanceOS" {
    default = "Canonical Ubuntu"
}
variable "InstanceOSVersion" {
    default = "16.04"
}
variable "region" {
    default = "us-phoenix-1"
}
variable "InstanceShape" {
    default = "VM.Standard1.8"
}
variable "private_key_path" {
    default = "./userdata/pvt.pem"
}
variable "ssh_private_key"{
  default ="./userdata/ssh_private_key.pem"
}
variable "ssh_public_key"  {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA7WTdp3TMn3HMW1xFEKU56gGeoXrdcn7MjPeh0QrzTzBzKBXzgIZr7FjeaZewSpBRRgy4iFmnM5U/XGJR2ztf2BavPFY10mQTf94yWoYVQY2p5jWrtIpYeRGSfy1KkfZL99WKhrW3ZWeISs7T+4e+f7zWwCv094q9LYfmGScDvMF7HJMZYEvPaDEmXvPu7pf499C90OBD//XiREVVHZHjNpbSyD33KA660r4lScoNBYY4jJWAHtTJePyLr3+ainOAVkz4J4zWeo+hfiurRdxaFf9NBo1Q7VRRS0hOyG9MPzlIYQUfZi6/yeS0yIfoLZjA5OBXgvrJ3h2E94019V8mDw== rsa-key-20171009"
}
variable "prefix" {
    default = "Ywfin"
}

