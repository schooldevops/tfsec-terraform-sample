/* 
작성자: 조제이
Terraform Setting: https://www.terraform.io/docs/language/settings/
If you need change the configuration, please check the official documentation of terraform.
*/

terraform {
/* 
Configuring a Terraform Backend
Standard Backends: artifactory, azurerm, consul, cos, etcd, etcdv3, gcs, http, kubernetes, manta, oss, pg, s3, swift

Current Backend: local
Terraform template 및 tfstate의 보관은 한곳으로함.
*/

  backend "local" {
    path = "./terraform.tfstate"
  }

  /*
  Current Backend: s3
  Variable: key
  */
  /* 
  backend "s3" {
    bucket = "ccs-tfstate-zipfile"
    region = "ap-northeast-2"
   # key값은 Initialize terraform시 입력 예) key = "{변수}.tfstate"
  }
*/
  /*
The required_providers block specifies all of the providers required by the current module, 
mapping each local provider name to a source address and a version constraint.

Current required_providers: hasicorp/aws
Version: "~> 3.27"
Variable: none
*/

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  /*
The required_version setting accepts a version constraint string, 
which specifies which versions of Terraform can be used with your configuration.

Version ">= 0.14.9"
*/
  required_version = ">= 0.14.9"
}

