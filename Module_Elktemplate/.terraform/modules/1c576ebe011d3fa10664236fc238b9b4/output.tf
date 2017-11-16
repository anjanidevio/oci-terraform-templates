output "avial_domain_name" {
    value = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[0],"name")}"
}
output "image_ocid" {
    value = "${lookup(data.oci_core_images.OLImageOCID.images[1], "id")}"
}
output "Elkvm_public_ip" {
    value = "${data.oci_core_vnic.elk-nic.public_ip_address}"
}
