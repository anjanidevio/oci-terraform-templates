output "linux-a_public_ip" {
    value = "${data.oci_core_vnic.lin-nic-a.public_ip_address}"
}

output "linux-a_private_ip" {
    value = "${data.oci_core_vnic.lin-nic-a.private_ip_address}"
}

output "linux-b_public_ip" {
    value = "${data.oci_core_vnic.lin-nic-b.public_ip_address}"
}

output "linux-b_private_ip" {
    value = "${data.oci_core_vnic.lin-nic-b.private_ip_address}"
}