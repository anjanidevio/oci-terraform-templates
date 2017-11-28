resource "oci_core_security_list" "nsl" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${var.vcn_ocid}"
  display_name = "${var.prefix}-nsl"
  egress_security_rules = [
    {
      protocol    = "all"
      destination = "0.0.0.0/0"
    }
  ]

  ingress_security_rules = [
    {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        "min" = 22
        "max" = 22
      }
    },
    {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        "min" = 5432
        "max" = 5432
      }
    },
    {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        "min" = 54321
        "max" = 54321
      }
    },
    {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        "min" = 11000
        "max" = 11000
      }
    }

  ]
}