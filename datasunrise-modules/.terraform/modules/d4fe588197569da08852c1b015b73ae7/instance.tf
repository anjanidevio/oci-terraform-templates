resource "oci_core_instance" "linux" {
  availability_domain = "${var.ad_name}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.prefix}-server"
  image = "${var.image_ocid}"
  shape = "${var.instanceShape}"
  create_vnic_details {
    subnet_id = "${var.subnet1_ocid}"
    display_name = "${var.prefix}-nic"
    assign_public_ip = true
    hostname_label = "${var.prefix}-instance"
  },
  metadata {
    ssh_authorized_keys = "${var.sshPublicKey}"
    user_data = "${base64encode(format("%s\n%s %s %s\n",
           file(var.bootStrapFileDir),
           "./enable-password.sh",
           "${var.admin_username}",
           "${var.admin_password}"
        ))}"
  }
}

resource "null_resource" "remote-exec" {
    depends_on = ["oci_core_instance.linux"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "15m"
        host = "${var.linux_public_ip}"
        user = "${var.admin_username}"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
        "cd ~${var.admin_username}",
        "curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-docker-ce/docker-ce/userdata/docker-ce-install.sh > docker-ce-install.sh",
        "chmod +x install-datarunrise.sh",
        "./install-datarunrise.sh ${var.admin_username} >> remote-exec.log 2>&1"
      ]
    }
}
