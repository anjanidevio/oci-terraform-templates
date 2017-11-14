output "avail_domain" {
    value = "${lookup(data.oci_identity_availability_domains.avldomain.availability_domains[0],"name")}"
}
 
 