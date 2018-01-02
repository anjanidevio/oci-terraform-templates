resource "oci_core_security_list" "puppetsecurityRules" {
    compartment_id = "${var.compartment_id}"
    vcn_id = "${var.vcn_ocid}"
    display_name = "${var.VCN-DisplayName}-puppetsecrules${var.uniqueid}"
    
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
    },
      ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"
        

        tcp_options {
            "min" = 443
            "max" = 443
        }
    },
    ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"
        

        tcp_options {
            "min" =8142
            "max" =8142
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
                "min" = 8140
                "max" = 8140
            }
        },
        ingress_security_rules {
            protocol = "6" 
            source = "0.0.0.0/0"
            
            tcp_options {
                "min" = 3000
                "max" = 3000
            }
        }

}
