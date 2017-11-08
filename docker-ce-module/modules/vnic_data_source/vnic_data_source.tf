data "oci_core_vnic_attachments" "linVnics-a" {
  compartment_id = "${var.compartment_ocid}" 
  availability_domain = "${var.ad1_name}"
  instance_id = "${var.instance_linux-a_ocid}"
} 

data "oci_core_vnic" "lin-nic-a" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.linVnics-a.vnic_attachments[0],"vnic_id")}"
}

data "oci_core_vnic_attachments" "linVnics-b" {
  compartment_id = "${var.compartment_ocid}" 
  availability_domain = "${var.ad2_name}"
  instance_id = "${var.instance_linux-b_ocid}"
} 

data "oci_core_vnic" "lin-nic-b" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.linVnics-b.vnic_attachments[0],"vnic_id")}"
}
