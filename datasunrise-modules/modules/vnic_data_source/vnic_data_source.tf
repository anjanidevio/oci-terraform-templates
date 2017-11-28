data "oci_core_vnic_attachments" "linVnics" {
  compartment_id = "${var.compartment_ocid}" 
  availability_domain = "${var.ad_name}"
  instance_id = "${var.instance_linux_ocid}"
} 

data "oci_core_vnic" "lin-nic" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.linVnics.vnic_attachments[0],"vnic_id")}"
}