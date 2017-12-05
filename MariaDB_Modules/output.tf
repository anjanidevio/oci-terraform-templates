output "MariadbPublicIP" {
  value = ["${module.instance.Mariadbvm_PublicIP}"]
}
output "MariadbPrivateIP" {
  value = ["${module.instance.Mariadbvm_PrivateIP}"]
}