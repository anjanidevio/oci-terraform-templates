resource "random_id" "uniqueString" {
  keepers = {
    DataString = "${var.VcnDisplayName}"
  }
  byte_length = 2
}