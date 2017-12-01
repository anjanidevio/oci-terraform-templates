output "dataSunriseGUIPassword" {
  value = "${var.dataSunrise-GUI-Password}"
}
output "dataSunriseGUIUsername" {
  value = "admin"
}
output "dataSunrisePublicIP" {
  value = "${module.vnic_data_source.linux_public_ip}"
}
output "postgrePassword" {
  value = "${var.postgrePassword}"
}