cluster_disable=true
parameter_group_name="default.redis6.x"
region="ap-northeast-2"

// Elasticache Redis 이름
cluster_name="cluster-disable-large-prod-1"

// Elasticache 서브넷 이름
subnet_group_name="default"
port=6379

// node의 유형 및 node의 수(복제본 포함)
node_type="cache.t4g.medium"
number_cache_clusters=3

// node의 수가 최소 2개 이상일때 true 가능
multi_az_enabled=true
at_rest_encryption_enabled=true
transit_encryption_enabled=true
automatic_failover_enabled=true

 // apply_immediately 'Default is false'
apply_immediately =true

// Tags
tags={name: "prod_disable_large_dev_1"} 