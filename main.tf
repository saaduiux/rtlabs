provider "aws" {
 region     = "ap-south-1"
}

module "virtualmachine" {
  source = "./virtualmachine"
}

module "database" {
  source = "./database"
}

module "network" {
  source = "./network"
}