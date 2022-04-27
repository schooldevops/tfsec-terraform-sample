/* 
작성자: 조제이
Terraform Setting: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
Configure the AWS Provider
*/

provider "aws" {
  profile = "default"
  region  = var.region
}