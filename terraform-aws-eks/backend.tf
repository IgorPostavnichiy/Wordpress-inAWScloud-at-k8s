terraform {
  backend "s3" {
    bucket         = "bucket-s3-itsprout"  
    key            = "terraform.tfstate"   
    region         = "eu-north-1"           
    encrypt        = true                  
    dynamodb_table = "terraform-lock" 
  }
}