resource "oci_core_security_list" "nsg" {
    compartment_id = "${var.compartment_ocid}"
    vcn_id = "${var.vcn_ocid}"
    display_name = "${var.prefix}-nsg"
    egress_security_rules =[
        {
            protocol = "all"
            destination = "0.0.0.0/0"
        }
    ]

    ingress_security_rules = [
        {
            protocol = "6" 
            source = "0.0.0.0/0"
            
            tcp_options {
                "min" = 443
                "max" = 443
            }
        },
        {
            protocol = "6" 
            source = "0.0.0.0/0"
            
            tcp_options {
                "min" = 80
                "max" = 80
            }
        },
        {
            protocol = "6" 
            source = "0.0.0.0/0"
            
            tcp_options {
                "min" = 22
                "max" = 22
            }
        },
        {
            protocol = "6" 
            source = "0.0.0.0/0"
            
            tcp_options {
                "min" = 7075
                "max" = 7075
            }
        },
        {
            protocol = "6" 
            source = "0.0.0.0/0"
            
            tcp_options {
                "min" = 8080
                "max" = 8080
            }
        },
        {
            protocol = "6" 
            source = "0.0.0.0/0"
            
            tcp_options {
                "min" = 1433
                "max" = 1433
            }
        }
    ]

}   