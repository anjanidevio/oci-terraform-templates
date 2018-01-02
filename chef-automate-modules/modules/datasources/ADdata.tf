data  "oci_identity_availability_domains" "availdomain" {
  compartment_id = "${var.compartment_id}"
}