variable "owner" {
  type = string
}

variable "environment" {
  type = string
}

variable "prefix" {
  type = string
}

variable "ttl" {
  type = string
}

variable "public_subnet_tag" {
  type = string
}

variable "private_subnet_tag" {
  type = string
}

# HCP Vault
variable "hvn_id" {
  description = "The ID of the HCP HVN."
  type        = string
  default     = "hcp-vault-hvn"
}

variable "hvn_peering_id" {
	type = string
}
