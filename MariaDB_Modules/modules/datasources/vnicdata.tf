data "oci_core_vnic_attachments" "mariadbnic" {
  compartment_id = "${var.compartment_id}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[0],"name")}"
  instance_id = "${var.mariadbvm_ocid}"
} 

data "oci_core_vnic" "mariadb-nic" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.mariadbnic.vnic_attachments[0],"vnic_id")}"
}