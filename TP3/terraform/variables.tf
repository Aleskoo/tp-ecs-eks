variable "region" {
  type    = string
  default = "eu-west-3"
}

variable "cluster_name" {
  type    = string
  default = "bc-eks"
}

variable "cluster_version" {
  type    = string
  default = "1.30"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0ebcdb39f7a526ef9"
}

variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-0af4f8bcc527df86e", "subnet-0764a1f81a29b5e2e"]
}

variable "node_instance_type" {
  type    = string
  default = "t3.medium"
}

variable "node_desired_size" {
  type    = number
  default = 2
}

variable "node_min_size" {
  type    = number
  default = 2
}

variable "node_max_size" {
  type    = number
  default = 5
}
