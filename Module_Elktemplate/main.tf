module "vcn" {
source = "modules/vcn"
VCN-DisplayName = "${var.VCN-DisplayName}"
compartment_id = "${var.compartment_id}"
ElkVcn-CIDR = "${var.ElkVcn-CIDR}"
VCN-DNSLabel = "${var.VCN-DNSLabel}"
}

module "internetgateway" {
source = "modules/internetgateway"
compartment_id = "${var.compartment_id}"
vcn_ocid = "${module.vcn.vcn_ocid}"
VCN-DisplayName = "${var.VCN-DisplayName}"
}


module "route_table" {
source = "modules/route_table"
compartment_id = "${var.compartment_id}"
VCN-DisplayName = "${var.VCN-DisplayName}"
internet_gateway_ocid = "${module.internetgateway.internet_gateway_ocid}"
vcn_ocid = "${module.vcn.vcn_ocid}"
}


module "securitylist" {
source = "modules/securitylist"
compartment_id = "${var.compartment_id}"
VCN-DisplayName = "${var.VCN-DisplayName}"
vcn_ocid = "${module.vcn.vcn_ocid}"
}

module "dhcp_options" {
source = "modules/dhcp_options"
compartment_id = "${var.compartment_id}"
VCN-DisplayName = "${var.VCN-DisplayName}"
vcn_ocid = "${module.vcn.vcn_ocid}"
}


module "datasources" {
source = "modules/datasources"
compartment_id = "${var.compartment_id}"
Elkvm_ocid = "${module.instance.Elkvm_ocid}"
InstanceOS = "${var.InstanceOS}"
InstanceOSVersion = "${var.InstanceOSVersion}"
}


module "subnet" {
source = "modules/subnet"
compartment_id = "${var.compartment_id}"
VCN-DisplayName = "${var.VCN-DisplayName}"
vcn_ocid = "${module.vcn.vcn_ocid}"
internet_gateway_ocid = "${module.internetgateway.internet_gateway_ocid}"
route_table_ocid = "${module.route_table.route_table_ocid}"
security_list_ocid = "${module.securitylist.security_list_ocid}"
dhcp_ocid = "${module.dhcp_options.dhcp_ocid}"
avial_domain_name = "${module.datasources.avial_domain_name}"
}


module "instance" {
source = "modules/instance"
compartment_id = "${var.compartment_id}"
VCN-DisplayName = "${var.VCN-DisplayName}"
avial_domain_name = "${module.datasources.avial_domain_name}"
subnet_ocid = "${module.subnet.subnet_ocid}"
image_ocid = "${module.datasources.image_ocid}"
InstanceShape = "${var.InstanceShape}"
ssh_public_key = "${var.ssh_public_key}"
BootStrapFile = "${var.BootStrapFile}"
BootStrapFile1 = "${var.BootStrapFile1}"
ssh_private_key = "${var.ssh_private_key}"
Elkvm_public_ip = "${module.datasources.Elkvm_public_ip}"
}
