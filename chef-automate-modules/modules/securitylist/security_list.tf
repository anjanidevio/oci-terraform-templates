resource "oci_core_security_list" "securityRules" {
    compartment_id = "${var.compartment_id}"
    vcn_id = "${var.vcn_ocid}"
    display_name = "${var.DisplayName}-secrules${var.uniqueid}"
    
   egress_security_rules =[
        {
            protocol = "all"
            destination = "0.0.0.0/0"
        }
    ]


// allow inbound tcp traffic on all ports
       ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"
        

        tcp_options {
            "min" = 80
            "max" = 80
        }
    }
      ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"
        

        tcp_options {
            "min" = 443
            "max" = 443
        }
    }
    ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"
        

        tcp_options {
            "min" =8989
            "max" =8989
        }
    },
    ingress_security_rules {
            protocol = "6" 
            source = "0.0.0.0/0"
            
            tcp_options {
                "min" = 22
                "max" = 22
            }
        },
        ingress_security_rules {
            protocol = "6" 
            source = "0.0.0.0/0"
            
            tcp_options {
                "min" = 3389
                "max" = 3389
            }
        },
        ingress_security_rules {
            protocol = "6" 
            source = "0.0.0.0/0"
            
            tcp_options {
                "min" = 5985
                "max" = 5985
            }
        }

}

