resource "oci_core_instance" "Elkvm" {
    availability_domain = "${var.avial_domain_name}"
    compartment_id = "${var.compartment_id}"
     display_name = "${var.VCN-DisplayName}-instance${var.unique_id}"
    image = "${var.image_ocid}"
    shape = "${var.InstanceShape}"
    subnet_id = "${var.subnet_ocid}"
  metadata {
        ssh_authorized_keys = "${var.ssh_public_key}"
        user_data = "${base64encode(file(var.BootStrapFile))}"
  }
  create_vnic_details {
    subnet_id = "${var.subnet_ocid}"
    display_name = "ELknic"
    assign_public_ip = true
    hostname_label = "ELKinstance"
  }
}
resource "null_resource" "remote-exec" {
    depends_on = ["oci_core_instance.Elkvm"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "15m"
        host = "${var.Elkvm_public_ip}"
        user = "ubuntu"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
        "cd ~ubuntu",
        "curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-elk-stack/Module_Elktemplate/modules/instance/instance.tf > elkstack_kibana.sh ",
        "chmod +x elkstack_kibana.sh",
        "./elkstack_kibana.sh >> remote-exec.log 2>&1"
      ]
    }
} 

resource "oci_core_instance" "Clientvm" {
    availability_domain = "${var.avial_domain_name}"
    compartment_id = "${var.compartment_id}"
    display_name = "${var.VCN-DisplayName}clientinstance${var.unique_id}"
    image = "${var.image_ocid}"
    shape = "${var.InstanceShape}"
    depends_on = ["oci_core_instance.Elkvm"]
    subnet_id = "${var.subnet_ocid}"
  metadata {
        ssh_authorized_keys = "${var.ssh_public_key}"
        user_data = "${base64encode(file(var.BootStrapFile1))}"
   }
 create_vnic_details {
    subnet_id = "${var.subnet_ocid}"
    display_name = "clientnic"
    assign_public_ip = true
    hostname_label = "clientinstance"
  }
}
