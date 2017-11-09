data "oci_core_vnic_attachments" "elknic" {
 compartment_id = "${var.compartment_id}"
  availability_domain = "${var.AD_name}"
  instance_id = "${oci_core_instance.Elkvm.id}"
} 

data "oci_core_vnic" "elk-nic" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.elknic.vnic_attachments[0],"vnic_id")}"
}