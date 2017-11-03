data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

data "oci_core_images" "OLImageOCID" {
  compartment_id = "${var.compartment_ocid}"
  operating_system = "${var.InstanceOS}"
  operating_system_version = "${var.InstanceOSVersion}"
}

# Gets a list of vNIC attachments on the instance
data "oci_core_vnic_attachments" "InstanceVnicas" {
    compartment_id = "${var.compartment_ocid}" 
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
    instance_id = "${oci_core_instance.JenkinsInstance.id}"
} 

# Gets the OCID of the first (default) vNIC
data "oci_core_vnic" "InstanceVnic" {
    vnic_id = "${lookup(data.oci_core_vnic_attachments.InstanceVnicas.vnic_attachments[0],"vnic_id")}"
}    
