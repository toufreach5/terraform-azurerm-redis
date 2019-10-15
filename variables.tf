variable "location" {
  description = "Azure region in which instance will be hosted"
  type        = string
}

variable "location_short" {
  description = "Azure region trigram"
  type        = string
}

variable "environment" {
  description = "Name of the application's environnement"
  type        = string
}

variable "stack" {
  description = "Name of the application stack"
  type        = string
}

variable "client_name" {
  description = "Name of the client"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the application ressource group, herited from infra module"
  type        = string
}

variable "custom_name" {
  description = "Custom name of redis server"
  type        = string
  default     = ""
}

variable "name_prefix" {
  description = "Optional prefix for the generated name"
  type        = string
  default     = ""
}

variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "Map of extra tags"
}

variable "capacity" {
  default     = 2
  description = "Redis size: (Basic/Standard: 1,2,3,4,5,6) (Premium: 1,2,3,4)  https://docs.microsoft.com/fr-fr/azure/redis-cache/cache-how-to-premium-clustering"
  type        = number
}

variable "sku_name" {
  default     = "Premium"
  description = "Redis Cache Sku name. Can be Basic, Standard or Premium"
  type        = string
}

variable "cluster_shard_count" {
  default     = "3"
  description = "Number of cluster shards desired"
  type        = string
}

variable "redis_additional_configuration" {
  type        = map(string)
  description = "Additional configuration for the Redis instance. Some of the keys are set automatically. See https://www.terraform.io/docs/providers/azurerm/r/redis_cache.html#redis_configuration for fulle referece"
  default     = {}
}

variable "authorized_cidrs" {
  type        = list(string)
  description = "List of authorized cidrs, must be provided using remote states cloudpublic/cloudpublic/global/vars/terraform.state --> authorized_cidrs"
}

variable "allow_non_ssl_connections" {
  default     = "false"
  description = "Activate non SSL port (6779) for Redis connection"
  type        = bool
}

variable "private_static_ip_address" {
  description = "The Static IP Address to assign to the Redis Cache when hosted inside the Virtual Network. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "The ID of the Subnet within which the Redis Cache should be deployed. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "data_persistence_enabled" {
  description = "\"true\" to enable data persistence."
  type        = string
  default     = "true"
}

variable "data_persistence_frequency_in_minutes" {
  description = "Data persistence snapshot frequency in minutes."
  type        = number
  default     = 60
}

variable "data_persistence_max_snapshot_count" {
  description = "Max number of data persistence snapshots."
  type        = string
  default     = null
}

variable "data_persistence_storage_custom_name" {
  description = "Custom name for the Storage Account used for Redis data persistence."
  type        = string
  default     = ""
}

variable "data_persistence_storage_account_tier" {
  description = "Replication type for the Storage Account used for data persistence."
  type        = string
  default     = "Premium"
}

variable "data_persistence_storage_account_replication" {
  description = "Replication type for the Storage Account used for data persistence."
  type        = string
  default     = "LRS"
}