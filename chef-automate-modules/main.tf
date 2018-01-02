module "vcn" {
source = "modules/vcn"
DisplayName = "${var.DisplayName}"
compartment_id  = "${var.compartment_id}"
Vcn-CIDR     = "${var.Vcn-CIDR}"
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
DisplayName  = "${var.DisplayName}"

}


module "route_table" {
source                = "modules/route_table"
compartment_id        = "${var.compartment_id}"
DisplayName       = "${var.DisplayName}"
uniqueid             = "${module.unique_id.uniqueid}"
internet_gateway_ocid = "${module.internetgateway.internet_gateway_ocid}"
vcn_ocid              = "${module.vcn.vcn_ocid}"
}


module "securitylist" {
source          = "modules/securitylist"
compartment_id  = "${var.compartment_id}"
DisplayName = "${var.DisplayName}"
 uniqueid      = "${module.unique_id.uniqueid}"
vcn_ocid        = "${module.vcn.vcn_ocid}"
}

module "dhcp_options" {
source           = "modules/dhcp_options"
compartment_id   = "${var.compartment_id}"
DisplayName  = "${var.DisplayName}"
vcn_ocid         = "${module.vcn.vcn_ocid}"
 uniqueid       = "${module.unique_id.uniqueid}"
}


module "datasources" {
source         = "modules/datasources"
compartment_id = "${var.compartment_id}"
chefserver_ocid     = "${module.instance.chefserver_ocid}"
chefautomate_ocid     = "${module.instance.chefautomate_ocid}"
chefworkstation_ocid     = "${module.instance.chefworkstation_ocid}"
InstanceOS     = "${var.InstanceOS}"
winInstanceOS     = "${var.winInstanceOS}"
InstanceOSVersion = "${var.InstanceOSVersion}"
winInstanceOSVersion = "${var.winInstanceOSVersion}"
}


module "subnet" {
source                = "modules/subnet"
compartment_id        = "${var.compartment_id}"
DisplayName       = "${var.DisplayName}"
vcn_ocid              = "${module.vcn.vcn_ocid}"
 uniqueid            = "${module.unique_id.uniqueid}"
internet_gateway_ocid = "${module.internetgateway.internet_gateway_ocid}"
route_table_ocid      = "${module.route_table.route_table_ocid}"
security_list_ocid    = "${module.securitylist.security_list_ocid}"
dhcp_ocid             = "${module.dhcp_options.dhcp_ocid}"
avial_domain_name     = "${module.datasources.avail_domain_name}"
avial_domain_name2     = "${module.datasources.avail_domain_name2}"


}


module "instance" {
source             = "modules/instance"
compartment_id     = "${var.compartment_id}"
DisplayName    = "${var.DisplayName}"
uniqueid         = "${module.unique_id.uniqueid}"
avial_domain_name  = "${module.datasources.avail_domain_name}"
avial_domain_name2  = "${module.datasources.avail_domain_name2}"
subnet_ocid        = "${module.subnet.subnet_ocid}"
casubnet_ocid        = "${module.subnet.casubnet_ocid}"
image_ocid         = "${module.datasources.image_ocid}"
wsimage_ocid         = "${module.datasources.wsimage_ocid}"
InstanceShape      = "${var.InstanceShape}"
ssh_public_key     = "${var.ssh_public_key}"
BootStrapFile      = "${var.BootStrapFile}"
ssh_private_key    = "${var.ssh_private_key}"
chefserver_public_ip    = "${module.datasources.chefserver_Public_ip}"
chefautomate_public_ip    = "${module.datasources.chefautomate_Public_ip}"
}
