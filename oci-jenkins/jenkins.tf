resource "oci_core_instance" "JenkinsInstance" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "JenkinsVM"
  image = "${lookup(data.oci_core_images.OLImageOCID.images[1], "id")}"
  shape = "${var.InstanceShape}"
  subnet_id = "${oci_core_subnet.subnet.id}"
  
  create_vnic_details {
    subnet_id = "${oci_core_subnet.subnet.id}"
    display_name = "jenkinsvnic"
    assign_public_ip = true
    hostname_label="jenkinsvm"
  }
  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
    user_data = "${base64encode(file(var.BootStrapFile))}"    
  }
}

#  resource "null_resource" "remote-exec" {
  #depends_on = ["oci_core_instance.chefVM"]
#    provisioner "remote-exec" {
#     connection {
#        agent = false
#      timeout = "15m"
#       host = "${data.oci_core_vnic.InstanceVnic.public_ip_address}"
#       user = "ubuntu"
#       private_key = "${(file(var.ssh_private_key))}"
#     }
#     inline = [
#       "wget https://github.com/yougandar/test/blob/master/script.sh > script.sh",
#       "chmod 777 script.sh" ,
#       "cat script.sh | tr -d '\r' > newscript.sh", 
#       "chmod +x newscript.sh",
#       "./newscript.sh"
#     ]
#   }
#}
