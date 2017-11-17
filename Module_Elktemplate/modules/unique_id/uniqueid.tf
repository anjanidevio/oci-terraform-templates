resource "random_id" "uniqueString" {
  keepers = {
    #Generate a new id each time we create a VCN environment
  }
  byte_length = 2
}
