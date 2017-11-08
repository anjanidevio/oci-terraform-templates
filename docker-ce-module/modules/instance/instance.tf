resource "oci_core_instance" "linux-a" {
  availability_domain = "${var.ad1_name}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.prefix}-manager-a"
  image = "${var.image_ocid}"
  shape = "${var.instanceShape}"
  create_vnic_details {
    subnet_id = "${var.subnet1_ocid}"
    display_name = "${var.prefix}-man-nic-a"
    assign_public_ip = true
    hostname_label = "${var.prefix}-man-a"
  },
  metadata {
    ssh_authorized_keys = "${var.sshPublicKey}"
    user_data = "${base64encode(format("%s\n%s %s %s\n",
           file(var.bootStrapFileDir),
           "./enable-password-auth.sh",
           "${var.admin_username}",
           "${var.admin_password}"
        ))}"
  }
}

resource "null_resource" "remote-exec" {
    depends_on = ["oci_core_instance.linux-a"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "15m"
        host = "${var.linux-a_public_ip}"
        user = "${var.admin_username}"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
        "cd ~${var.admin_username}",
        "curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-docker-ce/docker-ce/userdata/docker-ce-install.sh > docker-ce-install.sh",
        "chmod +x docker-ce-install.sh",
        "./docker-ce-install.sh ${var.admin_username} >> remote-exec.log 2>&1"
      ]
    }
}

resource "oci_core_instance" "linux-b" {
  availability_domain = "${var.ad2_name}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.prefix}-worker-b"
  image = "${var.image_ocid}"
  shape = "${var.instanceShape}"
  create_vnic_details {
    subnet_id = "${var.subnet2_ocid}"
    display_name = "${var.prefix}-wor-nic-b"
    assign_public_ip = true
    hostname_label = "${var.prefix}-wor-b"
  },
  metadata {
    ssh_authorized_keys = "${var.sshPublicKey}"
    user_data = "${base64encode(format("%s\n%s %s %s\n",
           file(var.bootStrapFileDir),
           "./enable-password-auth.sh",
           "${var.admin_username}",
           "${var.admin_password}"
        ))}"
  }
}

resource "null_resource" "remote-exec2" {
    depends_on = ["oci_core_instance.linux-b"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "15m"
        host = "${var.linux-b_public_ip}"
        user = "${var.admin_username}"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
        "cd ~${var.admin_username}",
        "curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-docker-ce/docker-ce/userdata/docker-ce-install.sh > docker-ce-install.sh",
        "chmod +x docker-ce-install.sh",
        "./docker-ce-install.sh ${var.admin_username} >> remote-exec.log 2>&1"
      ]
    }
}