output "admin-username" {
  value = "${var.admin_username}"
}

output "admin-password" {
  value = "${var.admin_password}"
}

output "splunk_public_ip" {
  value = ["${module.vnic_data.splunk_public_ip}"]
}

