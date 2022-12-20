variable "project" {
  description = "Google Cloud Project"
  type        = string
  default     = "dilizone"
}

variable "zone" {
  description = "Google Cloud Zone"
  type        = string
  default     = "europe-west9-a"
}

variable "machine_type" {
  description = "Compute Instance Machine Type"
  type        = string
  default     = "e2-small"
}

variable "instance_name" {
  description = "Instance Name (added to DNS)"
  type        = string
  default     = "debian"
}

variable "instance_number" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}

variable "dummy_var" {
}
