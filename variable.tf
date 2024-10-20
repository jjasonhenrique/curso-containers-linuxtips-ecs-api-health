variable "cluster_name" {
  default = "containers-linuxtips"
}

variable "region" {
  default = "us-east-1"
}

variable "ssm_alb" {
  default = "/containers-linuxtips/ecs/lb/id"
}

variable "ssm_listener" {
  default = "/containers-linuxtips/ecs/listener/id"
}

variable "ssm_alb_internal" {
  default = "/containers-linuxtips/ecs/lb/internal/id"
}

variable "ssm_listener_internal" {
  default = "/containers-linuxtips/ecs/listener/internal/id"
}

variable "ssm_vpc_id" {
  default = "/containers-linuxtips/vpc/vpc_id"
}

variable "ssm_private_subnet_1" {
  default = "/containers-linuxtips/vpc/subnet_private_1a"
}

variable "ssm_private_subnet_2" {
  default = "/containers-linuxtips/vpc/subnet_private_1b"
}

variable "ssm_private_subnet_3" {
  default = "/containers-linuxtips/vpc/subnet_private_1c"
}

variable "ssm_service_discovery_namespace" {
  default = "/containers-linuxtips/ecs/cloudmap/namespace"
}