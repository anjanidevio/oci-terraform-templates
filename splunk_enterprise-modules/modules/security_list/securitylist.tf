resource "oci_core_security_list" "securitylist" {
    compartment_id = "${var.COMP-ID}"
    vcn_id = "${var.vcn_ocid}"
     display_name = "${var.prefix}-${var.unique_id}"

        // allow outbound tcp traffic on all ports
        egress_security_rules {
        destination = "0.0.0.0/0"
        protocol = "6"
                }

        // allow outbound udp traffic on a port range
        egress_security_rules {
        destination = "0.0.0.0/0"
        protocol = "17" // udp
        stateless = true

        udp_options {
                "min" = 319
                "max" = 320
                }
                }

        // allow inbound ssh traffic
        ingress_security_rules {
        protocol = "6" // tcp
        source = "0.0.0.0/0"
        stateless = false

      
    tcp_options {
                "min" = 22
                "max" = 22
                }
                }
        // allow inbound icmp traffic of a specific type
        ingress_security_rules {
        protocol  = 1
        source    = "0.0.0.0/0"
        stateless = true

        icmp_options {
                "type" = 3
                "code" = 4
                }
                }
        // allow inbound http traffic of a specific type
        ingress_security_rules {
        protocol = "6" 
        source = "0.0.0.0/0"
        stateless = false

        tcp_options {
                "min" = 8000
                "max" = 8000
                }
                }
        // allow inbound https traffic
        ingress_security_rules {
        protocol = "6" // tcp
        source = "0.0.0.0/0"
        stateless = false

      
    tcp_options {
                "min" = 443     
                "max" = 443
                }
                }
        // allow inbound Allow-Receiver-TCP traffic
        ingress_security_rules {
        protocol = "6" // tcp
        source = "0.0.0.0/0"
        stateless = false

      
    tcp_options {
                "min" = 9997
                "max" = 9997
                }
                }
        // allow inbound Allow-HTTP-Event-Collector traffic
        ingress_security_rules {
        protocol = "6" // tcp
        source = "0.0.0.0/0"
        stateless = false

      
    tcp_options {
                "min" = 8088
                "max" = 8088
                }
                }
        // allow inbound Allow-Mgmt-From-VNC traffic
        ingress_security_rules {
        protocol = "6" // tcp
        source = "0.0.0.0/0"
        stateless = false

      
    tcp_options {
                "min" = 8080
                "max" = 8089
                }
                }

        }
