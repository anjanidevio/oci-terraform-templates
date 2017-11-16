data "oci_core_vnic_attachments" "elknic" {
  compartment_id = "${var.compartment_id}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[0],"name")}"
  instance_id = "${var.Elkvm_ocid}"
} 

data "oci_core_vnic" "elk-nic" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.elknic.vnic_attachments[0],"vnic_id")}"
}