output "YellowfinVM_Instancepublic_ip" {
  value = ["${module.vnic_data_source.linux-YellowfinVM_public_ip}"]
}

output "YellowfinVM_Instanceprivate_ip" {
  value = ["${module.vnic_data_source.linux-YellowfinVM_private_ip}"]
}
