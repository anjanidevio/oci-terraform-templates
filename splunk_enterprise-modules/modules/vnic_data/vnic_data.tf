data "oci_core_vnic_attachments" "splunkNic" {
  compartment_id = "${var.COMP-ID}" 
  availability_domain = "${var.avail_domain}"
  instance_id = "${var.splunk_instance}"
} 

data "oci_core_vnic" "splunk-nic" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.splunkNic.vnic_attachments[0],"vnic_id")}"
}

data "oci_core_vnic_attachments" "splunkclientNic" {
  compartment_id = "${var.COMP-ID}" 
  availability_domain = "${var.avail_domain}"
  instance_id = "${var.splunkclient_instance}"
} 

data "oci_core_vnic" "splunkclient-nic" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.splunkclientNic.vnic_attachments[0],"vnic_id")}"
}

