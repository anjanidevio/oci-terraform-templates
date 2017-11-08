output "ad1_name" {
    value = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
}
output "ad2_name" {
    value = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
}
output "ad3_name" {
    value = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[2],"name")}"
}