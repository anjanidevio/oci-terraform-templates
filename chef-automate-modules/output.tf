output "chefautomate_Publicip" {
  value = ["${module.datasources.chefautomate_Public_ip}"]
}


output "chefautomate_username" {

  value = ["${var.admin_username}"]
}

output "chefautomate_password" {
  value = ["${var.admin_password}"]
}
output "chefworkstation_Publicip" {
  value = ["${module.instance.chef_workstation_publicip}"]
}

output "Workstation_Username" {
  value = ["${module.datasources.Workstation_Username}"]
}
output "Workstation_Password" {
  value = ["${module.datasources.Workstation_Password}"]
}