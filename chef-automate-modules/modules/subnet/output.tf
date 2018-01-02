output subnet_ocid {
    value = "${oci_core_subnet.subnet.id}"
}
output casubnet_ocid {
    value = "${oci_core_subnet.subnet2.id}"
}