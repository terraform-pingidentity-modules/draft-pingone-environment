
variable "flow_url" {
  description = "DaVinci Flow URL containing JSON"
  type        = string
  default     = null
}

variable "connection" {
  description = "DaVinci Connection Info (Name, ID)"
  type = object({
    name = string
    id   = string
  })
  default = {
    name = null
    id   = null
  }
}
