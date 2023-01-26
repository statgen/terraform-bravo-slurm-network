variable "GOOGLE_CREDENTIALS" {
  description = "Placeholder to avoid warning from TF Cloud apply"
  type        = string
  default     = ""
}

variable "zone" {
  description = "Single GCP zone to allocate resources"
  type        = string
  default     = "us-central1-c"
}

variable "use_iap" {
  description = "Use google's IAP to access hosts instead of traditional ssh."
  type        = bool
  default     = false
}

variable "shared_app_capacity" {
  description = "Capacity in gb of slurm shared apps fileshare."
  type        = number
  default     = 2560
}

variable "shared_home_capacity" {
  description = "Capacity in gb of slurm home (data) fileshare."
  type        = number
  default     = 5120
}
