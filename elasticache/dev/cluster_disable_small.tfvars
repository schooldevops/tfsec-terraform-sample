cluster_disable=true
parameter_group_name="default.redis6.x"
region="ap-northeast-2"

// Elasticache Redis 이름
cluster_name="cluster-disable-small-dev-1"

// Elasticache 서브넷 이름
subnet_group_name="default"
port=6379

// node의 유형 및 node의 수(복제본 포함)
node_type="cache.t4g.micro"
number_cache_clusters=1

// node의 수가 최소 2개 이상일때 true 가능
multi_az_enabled=false
at_rest_encryption_enabled=false
transit_encryption_enabled=false
automatic_failover_enabled=false

 // apply_immediately 'Default is false'
apply_immediately =false

// Tags
tags={name: "dev_disable_small_dev_1"} 