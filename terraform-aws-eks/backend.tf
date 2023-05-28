# terraform {
#   backend "s3" {
#     bucket         = "s3-bucket-test-itsprout"  
#     key            = "terraform.tfstate"   
#     region         = "eu-north-1"           
#     encrypt        = true                  
#     dynamodb_table = "terraform-lock" 
#   }
# }