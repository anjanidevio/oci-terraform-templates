resource "oci_core_instance" "mariadbvm" {
    availability_domain = "${var.avail_domain_name}"
    compartment_id = "${var.compartment_id}"
     display_name = "${var.VCN-DisplayName}-instance${var.uniqueid}"
    image = "${var.image_ocid}"
    shape = "${var.InstanceShape}"
    subnet_id = "${var.subnet_ocid}"
  metadata {
        ssh_authorized_keys = "${var.ssh_public_key}"
        user_data = "${base64encode(file(var.BootStrapFile))}"
  }
  create_vnic_details {
    subnet_id = "${var.subnet_ocid}"
    display_name = "mariadbnic"
    assign_public_ip = true
    hostname_label = "MariaDBinstance"
  }
}
resource "null_resource" "remote-exec" {
    depends_on = ["oci_core_instance.mariadbvm"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "15m"
        host = "${var.mariadbvm_public_ip}"
        user = "ubuntu"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
        "cd ~ubuntu",
        "curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-mariadb/MariaDB_Modules/userdata/mariadb_wordpress.sh > mariadb_wordpress.sh ",
        "chmod +x mariadb_wordpress.sh",
        "./mariadb_wordpress.sh >> remote-exec.log 2>&1"
      ]
    }
} 
