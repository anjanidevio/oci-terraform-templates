module "vcn" {
source = "modules/vcn"
VCN-DisplayName = "${var.VCN-DisplayName}"
compartment_id  = "${var.compartment_id}"
mariadbVcn-CIDR     = "${var.mariadbVcn-CIDR}"
uniqueid      = "${module.unique_id.uniqueid}"
VCN-DNSLabel    = "${var.VCN-DNSLabel}"
}

module "unique_id" {
    	source = "modules/unique_id"
 	}



module "internetgateway" {
source           = "modules/internetgateway"
uniqueid        = "${module.unique_id.uniqueid}"
compartment_id   = "${var.compartment_id}"
vcn_ocid         = "${module.vcn.vcn_ocid}"
VCN-DisplayName  = "${var.VCN-DisplayName}"

}


module "route_table" {
source                = "modules/route_table"
compartment_id        = "${var.compartment_id}"
VCN-DisplayName       = "${var.VCN-DisplayName}"
uniqueid             = "${module.unique_id.uniqueid}"
internet_gateway_ocid = "${module.internetgateway.internet_gateway_ocid}"
vcn_ocid              = "${module.vcn.vcn_ocid}"
}


module "securitylist" {
source          = "modules/securitylist"
compartment_id  = "${var.compartment_id}"
VCN-DisplayName = "${var.VCN-DisplayName}"
 uniqueid      = "${module.unique_id.uniqueid}"
vcn_ocid        = "${module.vcn.vcn_ocid}"
}

module "dhcp_options" {
source           = "modules/dhcp_options"
compartment_id   = "${var.compartment_id}"
VCN-DisplayName  = "${var.VCN-DisplayName}"
vcn_ocid         = "${module.vcn.vcn_ocid}"
 uniqueid       = "${module.unique_id.uniqueid}"
}


module "datasources" {
source         = "modules/datasources"
compartment_id = "${var.compartment_id}"
mariadb_ocid     = "${module.instance.mariadb_ocid}"
InstanceOS     = "${var.InstanceOS}"
InstanceOSVersion = "${var.InstanceOSVersion}"
}


module "subnet" {
source                = "modules/subnet"
compartment_id        = "${var.compartment_id}"
VCN-DisplayName       = "${var.VCN-DisplayName}"
vcn_ocid              = "${module.vcn.vcn_ocid}"
 uniqueid            = "${module.unique_id.uniqueid}"
internet_gateway_ocid = "${module.internetgateway.internet_gateway_ocid}"
route_table_ocid      = "${module.route_table.route_table_ocid}"
security_list_ocid    = "${module.securitylist.security_list_ocid}"
dhcp_ocid             = "${module.dhcp_options.dhcp_ocid}"
avail_domain_name     = "${module.datasources.avail_domain_name}"
}


module "instance" {
source             = "modules/instance"
compartment_id     = "${var.compartment_id}"
VCN-DisplayName    = "${var.VCN-DisplayName}"
uniqueid         = "${module.unique_id.uniqueid}"
avail_domain_name  = "${module.datasources.avail_domain_name}"
subnet_ocid        = "${module.subnet.subnet_ocid}"
image_ocid         = "${module.datasources.image_ocid}"
InstanceShape      = "${var.InstanceShape}"
ssh_public_key     = "${var.ssh_public_key}"
BootStrapFile      = "${var.BootStrapFile}"
ssh_private_key    = "${var.ssh_private_key}"
mariadbvm_public_ip = "${module.datasources.mariadbvm_public_ip}"
}