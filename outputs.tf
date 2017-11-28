output "dostgrePassword" {
  value = ["${var.postgrePassword}"]
}
output "dataSunriseGUIUsername" {
  value = ["admin"]
}
output "dataSunriseGUIPassword" {
  value = ["${var.dataSunrise-GUI-Password}"]
}

output "dtsun_InstancePublicIP" {
  value = ["${module.vnic_data_source.linux_public_ip}"]
}