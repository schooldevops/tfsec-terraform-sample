cluster_enable=true
parameter_group_name="default.redis6.x.cluster.on"
region="${region}"

// Elasticache Redis 이름
cluster_name="${cluster_name}"

// Elasticache 서브넷 이름
subnet_group_name="${subnet_group_name}"
port=${port}

// node의 크기
node_type="${node_type}"

// node의 수가 최소 2개 이상일때 true 가능
multi_az_enabled=${multi_az_enabled}
at_rest_encryption_enabled=${at_rest_encryption_enabled}
transit_encryption_enabled=${transit_encryption_enabled}
automatic_failover_enabled=${automatic_failover_enabled}

 // apply_immediately 'Default is false'
apply_immediately=${apply_immediately}

// 각 노드 그룹의 복제본 노드 수
replicas_per_node_group=${replicas_per_node_group}

// 복제 그룹에 대한 노드 그룹(샤드) 수
num_node_groups=${num_node_groups}

// Tags
tags=${tags}