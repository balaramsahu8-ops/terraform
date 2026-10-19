resource "aws_dynamodb_table" "basic-dynamodb-table-bala" {
  name           = "remote-infra-db-table-bala"
  billing_mode   = "PAY_PER_REQYEST"
  hash_key       = "LockID"
 

  attribute {
    name = "LockID"
    type = "S"
  }

  
  tags = {
    Name        = "remote-infra-db-table-bala"    
  }
}
