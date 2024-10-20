module "proteins" {
  source = "github.com/jjasonhenrique/curso-containers-linuxtips-module-service?ref=v1.3.2"
  #source       = "/Users/matheus/Workspace/linuxtips/linuxtips-curso-containers-ecs-service-module"

  region       = var.region
  cluster_name = var.cluster_name

  service_name   = "nutrition-proteins"
  service_port   = "30000"
  service_cpu    = 256
  service_memory = 512

  task_minimum       = 1
  task_maximum       = 3
  service_task_count = 1

  capabilities = ["EC2"]

  container_image = "fidelissauro/proteins-grpc-service:latest"

  service_listener = data.aws_ssm_parameter.listener_internal.value
  alb_arn          = data.aws_ssm_parameter.alb_internal.value

  service_task_execution_role = aws_iam_role.main.arn

  service_healthcheck = {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 10
    interval            = 60
    matcher             = "200-399"
    path                = "/healthz"
    port                = 8080
  }

  service_launch_type = [
    {
      capacity_provider = "FARGATE_SPOT"
      weight            = 100
    }
  ]

  service_discovery_namespace = data.aws_ssm_parameter.service_discovery_namespace.value

  service_hosts = [
    "proteins.containers-linuxtips.internal.com"
  ]

  environment_variables = [
    {
      name  = "ZIPKIN_COLLECTOR_ENDPOINT"
      value = "http://jaeger-collector.containers-linuxtips.internal.com:80"
    }
  ]

  vpc_id = data.aws_ssm_parameter.vpc.value

  private_subnets = [
    data.aws_ssm_parameter.private_subnet_1.value,
    data.aws_ssm_parameter.private_subnet_2.value,
    data.aws_ssm_parameter.private_subnet_3.value,
  ]
}