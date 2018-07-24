variable "redis_name" {
  description = "Redis instance name"
}

variable "azure_region" {
  description = "Azure region in which instance will be hosted"
}

variable "azure_region_short" {
  description = "Azure region trigram"
}

variable "environment" {
  description = "Name of application's environnement"
}

variable "stack" {
  description = "Name of application stack"
}

variable "client_name" {
  description = "Name of client"
}

variable "resource_group_name" {
  description = "Name of the application ressource group, herited from infra module"
}

variable "redis_capacity" {
  default     = 2
  description = "Redis size: (Basic/Standard: 1,2,3,4,5,6) (Premium: 1,2,3,4)  https://docs.microsoft.com/fr-fr/azure/redis-cache/cache-how-to-premium-clustering"
}

variable "redis_enable_ssl" {
  default     = "false"
  description = "Activate Ssl port (6789) of Redis instance"
}

variable "redis_configuration" {
  type        = "map"
  description = "Set of redis configuration, accepted parameters: maxmemory_reserved (default: 200), maxmemory_delta (default: 200), maxmemory_policy (default: allkeys-lru), backup_frequency (default: 60), snapshot_count (default: 1)"

  default = {
    maxmemory_reserved = 200
    maxmemory_delta    = 200
    maxmemory_policy   = "allkeys-lru"
    backup_frequency   = 60
    snapshot_count     = 1
  }
}

variable "account_tier" {
  default     = "Standard"
  description = "Storage account for backup policy"
}

variable "account_replication_type" {
  default     = "GRS"
  description = "Type of storage replication : LRS,GRS,RAGRS,ZRS https://docs.microsoft.com/fr-fr/azure/storage/common/storage-redundancy"
}

variable "admin_cidrs" {
  type        = "list"
  description = "List of authorized cidrs, must be provided using remote states cloudpublic/cloudpublic/global/vars/terraform.state --> admin_cidrs"
}
