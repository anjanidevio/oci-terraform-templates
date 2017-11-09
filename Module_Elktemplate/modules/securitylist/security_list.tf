resource "oci_core_security_list" "ElksecurityRules" {
    compartment_id = "${var.compartment_id}"
    vcn_id = "${var.vcn_ocid}"
    display_name = "${var.DisplayName}-Elksecrules"
    
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
        "max" = 12000
      }
    }
  ]
}