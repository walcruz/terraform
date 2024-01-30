variable "environ" {
  description = "The environment (plus optional intent) this resources belong to. Set it as empty string for production."
  type        = string
}

variable "kv_name_client_secret" {
  description = "The name in KeyVault for storing the Client Secret (the AD Application password)"
  type        = string
  default     = "ad-keycloak-client-secret"
}

variable "realm_management_crole" {
  description = "The list of permisions of realm-management"
  type        = list(any)
  default = [
    "create-client",
    "impersonation",
    "manage-authorization",
    "manage-clients",
    "manage-events",
    "manage-identity-providers",
    "manage-realm",
    "manage-users",
    "query-clients",
    "query-groups",
    "query-realms",
    "query-users",
    "realm-admin",
    "view-authorization",
    "view-clients",
    "view-events",
    "view-identity-providers",
    "view-realm",
    "view-users"
  ]
}