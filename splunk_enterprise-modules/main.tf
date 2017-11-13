module "data_source_AD" {
    source = "modules/data_source_AD"
    tenancy_ocid = "${var.tenancy_ocid}"    
}

module "images_data_source" {
    source            = "modules/images_data_source"
    COMP-ID           = "${var.COMP-ID}"
    InstanceOS        = "${var.InstanceOS}"
    InstanceOSVersion = "${var.InstanceOSVersion}"
}

module "instance" {
    source            = "modules/Instances"
    COMP-ID           = "${var.COMP-ID}"
    prefix            = "${var.prefix}"
    splunk_image      = "${module.images_data_source.splunk_image}"
    InstanceShape     = "${var.InstanceShape}"
    subnet            = "${module.subnets.subnet}"
    BootStrapFile     = "${var.BootStrapFile}"
    avail_domain      = "${module.data_source_AD.avail_domain}"
    ssh_public_key      = "${var.ssh_public_key}"
    ssh_private_key   = "${var.ssh_private_key}"
    admin_username    = "${var.admin_username}"
    admin_password    = "${var.admin_password}"
    splunk_public_ip  = "${module.vnic_data.splunk_public_ip}"
}

module "dhcp_options" {
    source           = "modules/dhcp_options"
    COMP-ID          = "${var.COMP-ID}"
    prefix           = "${var.prefix}"
    vcn_ocid         = "${module.vcn.vcn_ocid}"
}

module "internet_gateway" {
    source           = "modules/internet_gateway"
    COMP-ID          = "${var.COMP-ID}"
    prefix           = "${var.prefix}"
    vcn_ocid         = "${module.vcn.vcn_ocid}"
}


module "vcn" {
    source           = "modules/vcn"
    COMP-ID          = "${var.COMP-ID}"
    prefix           = "${var.prefix}"
}

module "route_table" {
    source           = "modules/route_table"
    COMP-ID          = "${var.COMP-ID}"
    prefix           = "${var.prefix}"
    vcn_ocid         = "${module.vcn.vcn_ocid}"
    internet_gateway = "${module.internet_gateway.internet_gateway}"
}

module "security_list" {
    source           = "modules/security_list"
    COMP-ID          = "${var.COMP-ID}"
    prefix           = "${var.prefix}"
    vcn_ocid         = "${module.vcn.vcn_ocid}"
}

module "subnets" {
    source           = "modules/subnets"
    COMP-ID          = "${var.COMP-ID}"
    prefix           = "${var.prefix}"
    vcn_ocid         = "${module.vcn.vcn_ocid}"
    security_list    = "${module.security_list.security_list}"
    route_table      = "${module.route_table.route_table}"
    dhcp             = "${module.dhcp_options.dhcp}"
    avail_domain     = "${module.data_source_AD.avail_domain}"
}

module "vnic_data" {
    source           = "modules/vnic_data"
    COMP-ID          = "${var.COMP-ID}"
    avail_domain     = "${module.data_source_AD.avail_domain}"
    splunk_instance  = "${module.instance.splunk_instance}"
    }