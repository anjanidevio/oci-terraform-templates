output "unique_id" {
    value = "${random_id.uniqueString.hex}"
}