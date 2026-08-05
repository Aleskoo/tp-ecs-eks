# dynamodb:CreateTable refuse par IAM sur ce compte -> verrouillage via use_lockfile
# (lock natif S3, Terraform >= 1.10) plutot qu'une table DynamoDB.
terraform {
  backend "s3" {
    bucket       = "bc-tp3-tfstate-747082607185"
    key          = "bc-eks/terraform.tfstate"
    region       = "eu-west-3"
    use_lockfile = true
    encrypt      = true
  }
}
