## --- REQUIRED PARAMETERS ------------------------------------------------------------------------------------------------

variable "suffix" {
  description = "An arbitrary suffix that will be added to the end of the resource name(s). For example: an environment name, a business-case name, a numeric id, etc."
  type        = string
  validation {
    condition     = length(var.suffix) <= 14
    error_message = "A max of 14 character(s) are allowed."
  }
}

variable service_name {
  type        = string
  description = "Name of Google Cloud Run Service that being created."
}

variable region {
  type        = string
  description = "Region in which Google Cloud Run service would be deployed."
}

variable container_image_path {
  type        = string
  description = "Container Path of an application." // if using gcr, must be something: gcr.io/[PROJECT_NAME]/[APP]
}

## --- OPTIONAL PARAMETERS ------------------------------------------------------------------------------------------------
variable "gcp_project_id" {
  description = "Id of the GCP project"
  type        = string
  validation {
    condition     = can(regex("^[a-z]{2,7}-[a-z0-9]{3,18}$", var.gcp_project_id))
    error_message = "Must be of this format: `org-project` and a max of 30 characters."
  }
}

variable container_port {
  type        = number
  default     = 8080
  description = "Port on which the container is listening for incoming HTTP requests."
}

variable env_var {
  type        = map(string)
  default     = {}
  description = "Environment variables to inject into the service instance."
}

variable latest_revision {
  type        = bool
  default     = true
  description = "LatestRevision may be optionally provided to indicate that the latest ready Revision of the Configuration should be used for this traffic target."
}

variable cloud_run_timeout {
  type        = string
  default     = "20m"
  description = "How long a Cloud Run operation is allowed to take before being considered a failure."
}

variable allow_public_access {
  type        = bool
  default     = true
  description = "Allow non-authenticated access to the service."
}