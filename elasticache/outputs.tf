output "primary_endpoint" {
  value = var.cluster_disable ? aws_elasticache_replication_group.cluster_disable.*.primary_endpoint_address: null
}
output "reader_endpoint" {
  value = var.cluster_disable ? aws_elasticache_replication_group.cluster_disable.*.reader_endpoint_address : null
}
output "configuration_endpoint" {
  value = var.cluster_enable ? aws_elasticache_replication_group.cluster_enable.*.configuration_endpoint_address : null
}
output "member_clusters" {
  value = var.cluster_disable ? aws_elasticache_replication_group.cluster_disable.*.member_clusters : aws_elasticache_replication_group.cluster_enable.*.member_clusters
}
output "port" {
  value=var.cluster_disable ?  aws_elasticache_replication_group.cluster_disable.*.port : aws_elasticache_replication_group.cluster_enable.*.port
}
output "arn" {
  value=var.cluster_disable ? aws_elasticache_replication_group.cluster_disable.*.arn : aws_elasticache_replication_group.cluster_enable.*.arn
}