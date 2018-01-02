output "chefserver_ocid" {
    value = "${oci_core_instance.chefserver.id}"
}
output "chefautomate_ocid" {
    value = "${oci_core_instance.chefautomate.id}"
}
output "chefworkstation_ocid" {
    value = "${oci_core_instance.chefworkstation.id}"
}
 output "chef_workstation_publicip" {
   value = "${oci_core_instance.chefworkstation.public_ip}"
} 