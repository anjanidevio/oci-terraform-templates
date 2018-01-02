output "avail_domain_name" {
    value = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[0],"name")}"
}
output "image_ocid" {
    value = "${lookup(data.oci_core_images.OLImageOCID.images[1], "id")}"
}
output "puppetvm_public_ip" {
    value = "${data.oci_core_vnic.puppet-nic.public_ip_address}"
}
