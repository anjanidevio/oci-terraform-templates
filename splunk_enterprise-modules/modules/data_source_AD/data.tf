data  "oci_identity_availability_domains" "avldomain" {
  compartment_id = "${var.tenancy_ocid}"
}