/* 
작성자: 조제이
Terraform Setting: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group
cluster_enable = true 일때 실행
*/

resource "aws_elasticache_replication_group" "cluster_enable" {
  count = var.cluster_enable ? 1 : 0

  replication_group_id          = var.cluster_name
  replication_group_description = var.cluster_name

  // Elasticache Subnet Group: 캐시 서브넷 그룹의 이름 
  subnet_group_name             = var.subnet_group_name
  port                          = var.port
  parameter_group_name          = var.parameter_group_name

  // Node 유형
  node_type                     = var.node_type

  /* Default is false. See Amazon ElastiCache Documentation for more information.
    https://docs.aws.amazon.com/ko_kr/AmazonElastiCache/latest/APIReference/API_ModifyCacheCluster.html
  */
  apply_immediately             = var.apply_immediately

  // Replica 수가 2개 이상일때 true 가능
  multi_az_enabled              = var.multi_az_enabled

  // 암호화 설정 및 읽기 전용 replica의 자동 승격 여부
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  transit_encryption_enabled    = var.transit_encryption_enabled
  automatic_failover_enabled    = var.automatic_failover_enabled

  // Default: Engine "redis" 및 Engine Version "6.x"
  engine                        = var.engine
  engine_version                = var.engine_version

  cluster_mode {
    replicas_per_node_group = var.replicas_per_node_group
    num_node_groups         = var.num_node_groups
  }

  // Tags
  tags = var.tags
}
