data "oci_core_vnic_attachments" "InstanceVnicas" {
    compartment_id = "${var.compartment_ocid}" 
    availability_domain = "${var.ad_name}"
    instance_id = "${var.instance_YellowfinInstance_ocid}"
} 

data "oci_core_vnic" "InstanceVnic" {
    vnic_id = "${lookup(data.oci_core_vnic_attachments.InstanceVnicas.vnic_attachments[0],"vnic_id")}"
}