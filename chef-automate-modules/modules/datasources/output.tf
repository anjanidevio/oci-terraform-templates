output "avail_domain_name" {
    value = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[0],"name")}"
}
output "avail_domain_name2" {
    value = "${lookup(data.oci_identity_availability_domains.availdomain.availability_domains[1],"name")}"
}
output "image_ocid" {
    value = "${lookup(data.oci_core_images.OLImageOCID.images[1], "id")}"
}

output "wsimage_ocid" {
    value = "${lookup(data.oci_core_images.winImageOCID.images[1], "id")}"
}

output "chefserver_Public_ip" {
    value = "${data.oci_core_vnic.chef_server-nic.public_ip_address}"
}
output "chefautomate_Public_ip" {
    value = "${data.oci_core_vnic.chef_automate-nic.public_ip_address}"
}

output "Workstation_Username" {
 	value = ["${data.oci_core_instance_credentials.InstanceCredentials.username}"]
 	}
output "Workstation_Password" {
 	value = ["${data.oci_core_instance_credentials.InstanceCredentials.password}"]
 	}