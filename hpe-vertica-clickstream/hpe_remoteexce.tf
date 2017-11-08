resource "null_resource" "remote-exec" {
    depends_on = ["oci_core_instance.HPEVm"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "15m"
        host = "${data.oci_core_vnic.hpe-nic.public_ip_address}"
        user =  "${var.admin_username}"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
        "cd ~${var.admin_username}",
        "curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-hpe-vertica/hpe-vertica-clickstream/userdata/hpe_script.sh ",
        "chmod +x hpe_script.sh",
        "./hpe_script.sh ${var.admin_username}"
      ]
    }
}

data "oci_core_vnic_attachments" "hpenic" {
 compartment_id = "${var.compartment_id}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.AvailDomain.availability_domains[0],"name")}"
  instance_id = "${oci_core_instance.HPEVm.id}"
} 

data "oci_core_vnic" "hpe-nic" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.hpenic.vnic_attachments[0],"vnic_id")}"
}