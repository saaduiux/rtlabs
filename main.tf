provider "aws" {
 
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