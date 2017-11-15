output "ELKPublicIP" {
  value = ["${module.instance.ELk-kibanaPublicIP}"]
}
output "Clientpublicip" {
  value = ["${module.instance.ELk-kibanaPublicIP}"]
}
