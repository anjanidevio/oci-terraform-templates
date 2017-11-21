resource "oci_core_volume" "hpevolume" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.AvailDomain.availability_domains[0],"name")}"
  compartment_id = "${var.compartment_id}"
  display_name = "hpedatavolume"
  size_in_mbs = "${var.DBSize}"
}
resource "oci_core_volume_attachment" "hpeblockAttach" {
    attachment_type = "iscsi"
    compartment_id = "${var.compartment_id}"
    instance_id = "${oci_core_instance.HPEVm.id}"
    volume_id = "${oci_core_volume.hpevolume.id}"
}
