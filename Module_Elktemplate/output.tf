output "ELKPublicIP" {
  value = ["${module.instance.ELk-kibanaPublicIP}"]
}
output "Clientpublicip" {
  value = ["${module.instance.Clientvmpublicip}"]
}
output "ELKPrivateIP" {
  value = ["${module.instance.ELk-kibanaPrivateIP}"]
}
output "Clientprivateip" {
  value = ["${module.instance.Clientvmprivateip}"]
}
output "adminusername" {
  value = ["${var.admin_username}"]
}
output "adminpassword" {
  value = ["${var.admin_password}"]
}
