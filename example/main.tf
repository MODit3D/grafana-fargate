module "grafana" {
  source = "git@github.com:modit3d/grafana-fargate?ref=v1.0//tf"

  dns_zone      = "Z33LWS4EYPGVO4"
  region        = "us-east-1"
  vpc_id        = "vpc-762d5d0e"
  lb_subnets    = ["subnet-0786ef4c", "subnet-54332058"]
  subnets       = ["subnet-0786ef4c", "subnet-54332058"]
  db_subnet_ids = ["subnet-d7fc72e8", "subnet-db0771bf"]
  cert_arn      = "arn:aws:acm:us-east-1:223722655982:certificate/5ca132d0-db9e-4061-9ead-8fc6090d1a3a"
  dns_name      = "grafana.modit3d.xyz"
  account_id    = "223722655982"
  aws_account_ids = {
    main = "223722655982"
  }
  grafana_count = 2
}

// Run this module in sub accounts so that grafana can assume the Grafana role in the account
module "iam" {
  source = "git@github.com:modit3d/grafana-fargate?ref=v1.0//tf/iam_role/"

  grafana_account_id = "223722655982"
}


