variable "GOOGLE_CREDENTIALS" {
  description = "Placeholder to avoid warning from TF Cloud apply"
  type        = string
  default     = ""
}

variable "use_iap" {
  description = "Use google's IAP to access hosts instead of traditional ssh."
  type        = bool
  default     = false
}
