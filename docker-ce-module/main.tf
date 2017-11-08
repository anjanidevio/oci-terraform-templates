module "ad_data_source" {
    source = "modules/ad_data_source"
    tenancy_ocid = "${var.tenancy_ocid}"    
}

module "images_data_source" {
    source = "modules/images_data_source"
    compartment_ocid = "${var.compartment_ocid}"
    instanceLinOS = "${var.instanceLinOS}"
    instanceLinOSVersion = "${var.instanceLinOSVersion}"
}

module "instance" {
    source = "modules/instance"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}"
    image_ocid = "${module.images_data_source.image_ocid}"
    instanceShape = "${var.instanceShape}"
    subnet1_ocid = "${module.subnets.subnet1_ocid}"
    subnet2_ocid = "${module.subnets.subnet2_ocid}"
    bootStrapFileDir = "${var.bootStrapFileDir}"
    ad1_name = "${module.ad_data_source.ad1_name}"
    ad2_name = "${module.ad_data_source.ad2_name}"
    sshPublicKey = "${var.sshPublicKey}"
    ssh_private_key = "${var.ssh_private_key}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
    linux-a_public_ip = "${module.vnic_data_source.linux-a_public_ip}"
    linux-b_public_ip = "${module.vnic_data_source.linux-b_public_ip}"
}

module "internet_gateway" {
    source = "modules/internet_gateway"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}"
    vcn_ocid = "${module.vcn.vcn_ocid}"
}

module "vcn" {
    source = "modules/vcn"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}"
}

module "route_table" {
    source = "modules/route_table"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}"
    vcn_ocid = "${module.vcn.vcn_ocid}"
    internet_gateway_ocid = "${module.internet_gateway.internet_gateway_ocid}"
}

module "security_list" {
    source = "modules/security_list"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}"
    vcn_ocid = "${module.vcn.vcn_ocid}"
}

module "subnets" {
    source = "modules/subnets"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}"
    vcn_ocid = "${module.vcn.vcn_ocid}"
    security_list_ocid = "${module.security_list.security_list_ocid}"
    route_table_ocid = "${module.route_table.route_table_ocid}"
    dhcp_ocid = "${module.vcn.dhcp_ocid}"
    ad1_name = "${module.ad_data_source.ad1_name}"
    ad2_name = "${module.ad_data_source.ad2_name}"
}

module "vnic_data_source" {
    source = "modules/vnic_data_source"
    compartment_ocid = "${var.compartment_ocid}"
    ad1_name = "${module.ad_data_source.ad1_name}"
    ad2_name = "${module.ad_data_source.ad2_name}"
    instance_linux-a_ocid = "${module.instance.instance_linux-a_ocid}"
    instance_linux-b_ocid = "${module.instance.instance_linux-b_ocid}"
}