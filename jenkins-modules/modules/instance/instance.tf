resource "oci_core_instance" "JenkinsInstance" {
  availability_domain = "${var.ad1_name}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.prefix}-JenkinsVM"
  image = "${var.image_ocid}"
  shape = "${var.InstanceShape}"
  
  create_vnic_details {
    subnet_id = "${var.subnet1_ocid}"
    display_name = "${var.prefix}-jenkinsvnic"
    assign_public_ip = true
    hostname_label="${var.prefix}-jenkinsvm"
  }
  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
    user_data = "${base64encode(file(var.BootStrapFile))}"    
  }
}
