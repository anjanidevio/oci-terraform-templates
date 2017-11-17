output "admin-username" {
  value = ["${var.admin_username}"]
}

output "admin-password" {
  value = ["${var.admin_password}"]
}

output "Manager_InstancePublicIP" {
  value = ["${module.vnic_data_source.linux-a_public_ip}"]
}

output "Manager_InstancePrivateIP" {
  value = ["${module.vnic_data_source.linux-a_private_ip}"]
}
 
output "Worker_InstancePublicIP" {
  value = ["${module.vnic_data_source.linux-b_public_ip}"]
}

output "Worker_InstancePrivateIP" {
  value = ["${module.vnic_data_source.linux-b_private_ip}"]
}

