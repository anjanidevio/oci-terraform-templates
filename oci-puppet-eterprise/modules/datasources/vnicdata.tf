data "oci_core_vnic_attachments" "puppetnic" {
  compartment_id = "${var.compartment_id}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[0],"name")}"
  instance_id = "${var.puppetvm_ocid}"
} 

data "oci_core_vnic" "puppet-nic" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.puppetnic.vnic_attachments[0],"vnic_id")}"
}