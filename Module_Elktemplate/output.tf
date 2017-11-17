output "ELKPublicIP" {
  value = ["${module.instance.ELk-kibanaPublicIP}"]
}
output "Clientpublicip" {
  value = ["${module.instance.Clientvmpublicip}"]
}
output "adminusername" {
  value = ["${var.admin_username}"]
}

output "adminpassword" {
  value = ["${var.admin_password}"]
}
