/* 
작성자: 조제이
Terraform Setting: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group
cluster_disable = true 일때 실행
*/

resource "aws_elasticache_replication_group" "cluster_disable" {
  count = var.cluster_disable ? 1 : 0

  replication_group_id          = var.cluster_name
  replication_group_description = var.cluster_name

  // Elasticache Subnet Group: 캐시 서브넷 그룹의 이름 
  subnet_group_name    = var.subnet_group_name
  port                 = var.port
  parameter_group_name = var.parameter_group_name

  // Node 유형 및 수
  node_type             = var.node_type
  number_cache_clusters = var.number_cache_clusters

  /* Default is false. See Amazon ElastiCache Documentation for more information.
    https://docs.aws.amazon.com/ko_kr/AmazonElastiCache/latest/APIReference/API_ModifyCacheCluster.html
  */
  apply_immediately = var.apply_immediately

  // 노드의 수가 2개 이상일때 true 가능
  multi_az_enabled           = var.multi_az_enabled
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled
  automatic_failover_enabled = var.automatic_failover_enabled

  // Default: Engine "redis" 및 Engine Version "6.x"
  engine         = var.engine
  engine_version = var.engine_version

  // Tags
  tags = var.tags
}
