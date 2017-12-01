output "linux_public_ip" {
    value = "${data.oci_core_vnic.lin-nic.public_ip_address}"
}

output "linux_private_ip" {
    value = "${data.oci_core_vnic.lin-nic.private_ip_address}"
}