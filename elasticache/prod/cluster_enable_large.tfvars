cluster_enable=true
parameter_group_name="default.redis6.x.cluster.on"
region="ap-northeast-2"

// Elasticache Redis 이름
cluster_name="cluster-enable-large-prod-1"

// Elasticache 서브넷 이름
subnet_group_name="default"
port=6379

// node의 유형
node_type="cache.t4g.medium"

// Replica가 최소 1개 이상일때 true 가능
multi_az_enabled=true

// 암호화 설정 및 읽기 전용 replica의 자동 승격 여부
at_rest_encryption_enabled=true
transit_encryption_enabled=true
automatic_failover_enabled=true

 // apply_immediately 'Default is false'
apply_immediately=true

// 각 노드 그룹의 복제본 노드 수
replicas_per_node_group=2

// 복제 그룹에 대한 노드 그룹(샤드) 수
num_node_groups=3

// Tags
tags={name: "prod_enable_large_dev_1"} 