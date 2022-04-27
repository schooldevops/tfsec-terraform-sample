cluster_disable=true
parameter_group_name="default.redis6.x"
region="${region}"

// Elasticache Redis 이름
cluster_name="${cluster_name}"

// Elasticache 서브넷 이름
subnet_group_name="${subnet_group_name}"
port=${port}

// node의 크기 및 node의 수(복제본 포함)
node_type="${node_type}"
number_cache_clusters=${number_cache_clusters}

// node의 수가 최소 2개 이상일때 true 가능
multi_az_enabled=${multi_az_enabled}
at_rest_encryption_enabled=${at_rest_encryption_enabled}
transit_encryption_enabled=${transit_encryption_enabled}
automatic_failover_enabled=${automatic_failover_enabled}

 // apply_immediately 'Default is false'
apply_immediately=${apply_immediately}

// Tags
tags=${tags}