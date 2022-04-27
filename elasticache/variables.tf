// Cluster Disable Variables
variable "cluster_disable" {
  description = "aws_elasticache_cluster_disable type"
  type        = bool
  default     = false
}
variable "number_cache_clusters" {
  description = "(Optional) The number of cache clusters (primary and replicas) this replication group will have. If Multi-AZ is enabled, the value of this parameter must be at least 2. Updates will occur before other modifications. One of number_cache_clusters or cluster_mode is required."
  type        = string
  default     = 2
}

// Cluster Enable Variables
variable "cluster_enable" {
  description = "aws_elasticache_cluster_enable type"
  type        = bool
  default     = false
}
variable "replicas_per_node_group" {
  description = "(Required) Number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will trigger an online resizing operation before other settings modifications."
  type        = number
  default     = 1
}
variable "num_node_groups" {
  description = "(Required) Number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications."
  type        = number
  default     = 1
}
variable "cluster_name" {
  description = "클러스터 OR Node 이름"
  type        = string
}
variable "node_type" {
  description = "Amazon ElastiCache Cache Node Type"
  type        = string
}

variable "port" {
  description = "(Optional) The port number on which each of the cache nodes will accept connections. For Memcached the default is 11211, and for Redis the default port is 6379. Cannot be provided with replication_group_id. Changing this value will re-create the resource."
  type        = number
  default     = 6379
}

variable "engine" {
  description = "(Optional) The name of the cache engine to be used for the clusters in this replication group. The only valid value is redis."
  type        = string
  default     = "redis"
}

variable "engine_version" {
  description = "(Optional) The version number of the cache engine to be used for the cache clusters in this replication group. If the version is 6 or higher, only the major version can be set, e.g. 6.x,"
  type        = string
  default     = "6.x"
}

variable "parameter_group_name" {
  description = "(Required unless replication_group_id is provided) The name of the parameter group to associate with this cache cluster."
  type        = string
}

variable "subnet_group_name" {
  description = "(Required) Name for the cache subnet group. Elasticache converts this name to lowercase."
  type        = string
}

variable "region" {
  description = "(Optional) This is the AWS region. It must be provided, but it can also be sourced from the AWS_DEFAULT_REGION environment variables, or via a shared credentials file if profile is specified."
  type        = string
  default     = "ap-northeast-2"
}
variable "apply_immediately" {
  description = "(Optional) Whether any database modifications are applied immediately, or during the next maintenance window. Default is false. See Amazon ElastiCache Documentation for more information."
  type        = bool
  default     = false
}

variable "multi_az_enabled" {
  description = "(Optional) Specifies whether to enable Multi-AZ Support for the replication group. If true, automatic_failover_enabled must also be enabled. Defaults to false."
  type        = bool
  default     = false
}

variable "automatic_failover_enabled" {
  description = "(Optional) Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. If enabled, number_cache_clusters must be greater than 1. Must be enabled for Redis (cluster mode enabled) replication groups. Defaults to false."
  type        = bool
  default     = false
}

variable "at_rest_encryption_enabled" {
  description = "(Optional) Whether to enable encryption at rest."
  type        = bool
  default     = false
}

variable "transit_encryption_enabled" {
  description = "(Optional) Whether to enable encryption in transit."
  type        = bool
  default     = false
}
variable "tags" {
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map
}