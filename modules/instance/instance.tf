resource "oci_core_instance" "YellowfinInstance" {
  availability_domain = "${var.ad_name}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.prefix}-VM"
  image = "${var.image_ocid}"
  shape = "${var.InstanceShape}"
  
  create_vnic_details {
    subnet_id = "${var.subnet_ocid}"
    display_name = "${var.prefix}-vnic"
    assign_public_ip = true
    hostname_label="${var.prefix}-VM"
  }
  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"   
  }
}



 
