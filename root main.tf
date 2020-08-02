module "dev_env" {
  source = "./modules"
  
  vpc_cidr = "10.10.0.0/16"
  pubsub_cidr = "10.10.1.0/24"
  presub_cidr = "10.10.10.0/24"
  azs = "us-east-1a"
}