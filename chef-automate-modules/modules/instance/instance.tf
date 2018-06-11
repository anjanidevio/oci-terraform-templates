resource "oci_core_instance" "chefserver" {
    availability_domain = "${var.avial_domain_name}"
    compartment_id = "${var.compartment_id}"
     display_name = "${var.DisplayName}-server${var.uniqueid}"
    image = "${var.image_ocid}"
    shape = "${var.InstanceShape}"
    subnet_id = "${var.subnet_ocid}"
  metadata {
        ssh_authorized_keys = "${var.ssh_public_key}"
        user_data = "${base64encode(file(var.BootStrapFile))}"
  }
  create_vnic_details {
    subnet_id = "${var.subnet_ocid}"
    display_name = "chefnic"
    assign_public_ip = true
    private_ip = "10.0.0.3"
    hostname_label = "chefserver"
  }
}
resource "null_resource" "remote-exec" {
    depends_on = ["oci_core_instance.chefserver"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "15m"
        host = "${var.chefserver_public_ip}"
        user = "ubuntu"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
       "curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-chef-automate/chef-automate-modules/userdata/chefserver.sh > chefserver.sh",
       "chmod 777 chefserver.sh",
       "cat chefserver.sh | tr -d '\r' > server.sh",
       "chmod +x server.sh",
       "./server.sh  >> remote-exec.log 2>&1"
      ]
    }
} 

resource "oci_core_instance" "chefautomate" {
    availability_domain = "${var.avial_domain_name2}"
    compartment_id = "${var.compartment_id}"
     display_name = "${var.DisplayName}-automate${var.uniqueid}"
    image = "${var.image_ocid}"
    shape = "${var.InstanceShape}"
    subnet_id = "${var.casubnet_ocid}"
  metadata {
        ssh_authorized_keys = "${var.ssh_public_key}"
        user_data = "${base64encode(file(var.BootStrapFile))}"
  }
  create_vnic_details {
    subnet_id = "${var.casubnet_ocid}"
   display_name = "chefautomatenic"
    assign_public_ip = true
    private_ip = "10.0.1.2"
    hostname_label = "chefautomate"
  }
}
 resource "null_resource" "remote-exec1" {
    depends_on = ["oci_core_instance.chefautomate"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "15m"
        host = "${var.chefautomate_public_ip}"
        user = "ubuntu"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
       "curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-chef-automate/chef-automate-modules/userdata/chefautomate.sh > chefautomate.sh",
       "chmod 777 chefautomate.sh",
       "cat chefautomate.sh | tr -d '\r' > automate.sh",
       "chmod +x automate.sh",
       "./automate.sh  >> remote-exec.log 2>&1"
      ]
    }
} 
 
resource "oci_core_instance" "chefworkstation" {
    availability_domain = "${var.avial_domain_name}"
    compartment_id = "${var.compartment_id}"
    display_name = "${var.DisplayName}-workstation${var.uniqueid}"
    image = "${var.wsimage_ocid}"
    shape = "${var.InstanceShape}"
    subnet_id = "${var.subnet_ocid}"
create_vnic_details {
    subnet_id = "${var.subnet_ocid}"
    display_name = "${var.DisplayName}-wsnic1"
    assign_public_ip = true
     private_ip = "10.0.0.5"
    hostname_label = "${var.DisplayName}-ws" 
}
metadata {}
}
