
variable "flow_url" {
  description = "DaVinci Flow URL containing JSON"
  type        = string
  default     = null
}

variable "connection" {
  description = "DaVinci Connection Info"
  type = object({
    name = string
    id   = string
  })
  default = {
    name = null
    id   = null
  }
}
