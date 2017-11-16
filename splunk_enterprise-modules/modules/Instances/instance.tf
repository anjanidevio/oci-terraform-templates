
resource "oci_core_instance" "splunkvm" {
    availability_domain = "${var.avail_domain}"   
    compartment_id = "${var.COMP-ID}"
    display_name = "${var.prefix}-${var.unique_id}"
    image = "${var.image_ocid}"
    shape = "${var.InstanceShape}"
  metadata {
        ssh_authorized_keys = "${var.ssh_public_key}"
        user_data = "${base64encode(format("%s\n%s %s %s\n",
           file(var.BootStrapFile),
           "./enable-password.sh",
           "${var.admin_username}",
           "${var.admin_password}"
        ))}"
  }
 create_vnic_details {
   
    subnet_id = "${var.subnet}"
    display_name = "${var.prefix}-${var.unique_id}"
    assign_public_ip = true
    hostname_label = "${var.prefix}-${var.unique_id}"
  }
    }
resource "null_resource" "remote-exec0" {
    depends_on = ["oci_core_instance.splunkvm"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "5m"
        host = "${var.splunk_public_ip}"
        user = "${var.admin_username}"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
        "wget https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-splunk-enterprise/splunk-enetrprise/userdata/splunk-install.sh ",
        "chmod 777 splunk-install.sh",
        "chmod 777 splunk-install.sh",
        "./splunk-install.sh ${var.admin_username} >> remote-exec.log 2>&1"
      ]
    }
}
resource "oci_core_instance" "clientinstance" {
     availability_domain = "${var.avail_domain}" 
    compartment_id = "${var.COMP-ID}"
    display_name = "splunk_clientvm"
    image = "${var.image_ocid}"
    shape = "${var.InstanceShape}"
    depends_on = ["oci_core_instance.splunkvm"]
  metadata {
 ssh_authorized_keys = "${var.ssh_public_key}"
 user_data = "${base64encode(file(var.BootStrapFile))}"
   }
 create_vnic_details {
    subnet_id = "${var.subnet}"
    display_name = "clientnic"
    assign_public_ip = true
    hostname_label = "${var.prefix}${var.unique_id}"
  }
}
