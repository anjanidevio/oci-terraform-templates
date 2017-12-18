output "ad_name" {
    value = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
}