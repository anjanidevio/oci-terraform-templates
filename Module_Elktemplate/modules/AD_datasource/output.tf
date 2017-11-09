output "AD_name" {
    value = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[0],"name")}"
}