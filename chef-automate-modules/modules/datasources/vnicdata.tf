data "oci_core_vnic_attachments" "chef_server_nic" {
  compartment_id = "${var.compartment_id}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[0],"name")}"
  instance_id = "${var.chefserver_ocid}"
} 

data "oci_core_vnic" "chef_server-nic" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.chef_server_nic.vnic_attachments[0],"vnic_id")}"
}

data "oci_core_vnic_attachments" "chef_automate_nic" {
  compartment_id = "${var.compartment_id}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[1],"name")}"
  instance_id = "${var.chefautomate_ocid}"
} 

data "oci_core_vnic" "chef_automate-nic" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.chef_automate_nic.vnic_attachments[0],"vnic_id")}"
}

data "oci_core_instance_credentials" "InstanceCredentials" {
 	instance_id = "${var.chefworkstation_ocid}"
 	}