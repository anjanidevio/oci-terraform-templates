output "JenkinsVM_Instancepublic_ip" {
  value = ["${module.vnic_data_source.linux-JenkinsVM_public_ip}"]
}

output "JenkinsVM_Instanceprivate_ip" {
  value = ["${module.vnic_data_source.linux-JenkinsVM_private_ip}"]
}