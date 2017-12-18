module "data_sources" {
    source = "modules/data_sources"
    tenancy_ocid = "${var.tenancy_ocid}"    
}

module "images_data_source" {
    source = "modules/images_data_source"
    compartment_ocid = "${var.compartment_ocid}"
    InstanceOS = "${var.InstanceOS}"
    InstanceOSVersion = "${var.InstanceOSVersion}"
}

module "instance" {
    source = "modules/instance"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}${module.unique_id.unique_id}"
    image_ocid = "${module.images_data_source.image_ocid}"
    InstanceShape = "${var.InstanceShape}"
    subnet_ocid = "${module.subnets.subnet_ocid}"
    ad_name = "${module.data_sources.ad_name}"
    ssh_public_key = "${var.ssh_public_key}"
}

module "internet_gateway" {
    source = "modules/internet_gateway"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}${module.unique_id.unique_id}"
    vcn_ocid = "${module.vcn.vcn_ocid}"
}

module "vcn" {
    source = "modules/vcn"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}${module.unique_id.unique_id}"
}

module "route_table" {
    source = "modules/route_table"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}${module.unique_id.unique_id}"
    vcn_ocid = "${module.vcn.vcn_ocid}"
    internet_gateway_ocid = "${module.internet_gateway.internet_gateway_ocid}"
}

module "security_list" {
    source = "modules/security_list"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}${module.unique_id.unique_id}"
    vcn_ocid = "${module.vcn.vcn_ocid}"
}

module "subnets" {
    source = "modules/subnets"
    compartment_ocid = "${var.compartment_ocid}"
    ad_name = "${module.data_sources.ad_name}"
    route_table_ocid = "${module.route_table.route_table_ocid}"
    vcn_ocid = "${module.vcn.vcn_ocid}"
    security_list_ocid = "${module.security_list.security_list_ocid}"
    dhcp_ocid = "${module.vcn.dhcp_ocid}"
    prefix = "${var.prefix}${module.unique_id.unique_id}"
}

module "vnic_data_source" {
    source = "modules/vnic_data_source"
    compartment_ocid = "${var.compartment_ocid}"
    ad_name = "${module.data_sources.ad_name}"
   instance_YellowfinInstance_ocid = "${module.instance.instance_YellowfinInstance_ocid}"
}
module "unique_id" {
    source = "modules/unique_id"
}