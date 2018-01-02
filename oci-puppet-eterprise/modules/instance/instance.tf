resource "oci_core_instance" "puppetvm" {
    availability_domain = "${var.avial_domain_name}"
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
    display_name = "puppetnic"
    assign_public_ip = true
    hostname_label = "puppet-master"
  }
}
resource "null_resource" "remote-exec" {
    depends_on = ["oci_core_instance.puppetvm"]
    
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "20m"
        host = "${var.puppetvm_public_ip}"
        user = "ubuntu"
        private_key = "${(file(var.ssh_private_key))}"
      }
      inline = [
       "curl https://raw.githubusercontent.com/sudheermareddy/test/master/puppetsetup.sh > puppetsetup.sh",
       "chmod 777 puppetsetup.sh",
       "./puppetsetup.sh >> remote-exec.log 2>&1" 
      ]
    }
} 

