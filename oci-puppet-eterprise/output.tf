output "Puppet_master_PublicIP" {
  value = ["${module.instance.Puppet_master_PublicIP}"]
}

output "adminusername" {

  value = ["${var.admin_username}"]
}

output "adminpassword" {
  value = ["${var.admin_password}"]
}
  