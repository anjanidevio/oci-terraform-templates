output "postgrePassword" {
  value = "${var.postgrePassword}"
}
output "dtsun_InstancePublicIP" {
  value = "${module.vnic_data_source.linux_public_ip}"
}
output "dataSunriseGUIUsername" {
  value = "admin"
}
output "dataSunriseGUIPassword" {
  value = "${var.dataSunrise-GUI-Password}"
}