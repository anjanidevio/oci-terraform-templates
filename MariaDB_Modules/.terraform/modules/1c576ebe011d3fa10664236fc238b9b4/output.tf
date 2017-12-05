output "avail_domain_name" {
    value = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[0],"name")}"
}
output "image_ocid" {
    value = "${lookup(data.oci_core_images.OLImageOCID.images[1], "id")}"
}
output "mariadbvm_public_ip" {
    value = "${data.oci_core_vnic.mariadb-nic.public_ip_address}"
}