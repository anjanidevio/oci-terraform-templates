resource "oci_core_instance" "HPEVm" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.AvailDomain.availability_domains[0],"name")}"
    compartment_id = "${var.compartment_id}"
    display_name = "${var.VcnDisplayName}instance${random_id.uniqueString.hex}"
    image = "${lookup(data.oci_core_images.OLImageOCID.images[0], "id")}"
    shape = "${var.InstanceShape}"
    subnet_id = "${oci_core_subnet.HPEsubnet.id}"
  metadata {
        ssh_authorized_keys = "${var.ssh_public_key}"
        user_data = "${base64encode(file(var.BootStrapFile))}"
  }
  create_vnic_details {
    subnet_id = "${oci_core_subnet.HPEsubnet.id}"
    display_name = "hpenic"
    assign_public_ip = true
    hostname_label = "HPEinstance"
  }
}