variable "kinesis_analytics_applications" {
  description = <<EOT
Map of kinesis_analytics_applications, attributes below
Required:
    - name
Optional:
    - code
    - description
    - region
    - start_application
    - tags
    - tags_all
    - cloudwatch_logging_options (block):
        - log_stream_arn (required)
        - role_arn (required)
    - inputs (block):
        - kinesis_firehose (optional, block):
            - resource_arn (required)
            - role_arn (required)
        - kinesis_stream (optional, block):
            - resource_arn (required)
            - role_arn (required)
        - name_prefix (required)
        - parallelism (optional, block):
            - count (optional)
        - processing_configuration (optional, block):
            - lambda (required, block):
                - resource_arn (required)
                - role_arn (required)
        - schema (required, block):
            - record_columns (required, block):
                - mapping (optional)
                - name (required)
                - sql_type (required)
            - record_encoding (optional)
            - record_format (required, block):
                - mapping_parameters (optional, block):
                    - csv (optional, block):
                        - record_column_delimiter (required)
                        - record_row_delimiter (required)
                    - json (optional, block):
                        - record_row_path (required)
        - starting_position_configuration (optional, block):
            - starting_position (optional)
    - outputs (block):
        - kinesis_firehose (optional, block):
            - resource_arn (required)
            - role_arn (required)
        - kinesis_stream (optional, block):
            - resource_arn (required)
            - role_arn (required)
        - lambda (optional, block):
            - resource_arn (required)
            - role_arn (required)
        - name (required)
        - schema (required, block):
            - record_format_type (required)
    - reference_data_sources (block):
        - s3 (required, block):
            - bucket_arn (required)
            - file_key (required)
            - role_arn (required)
        - schema (required, block):
            - record_columns (required, block):
                - mapping (optional)
                - name (required)
                - sql_type (required)
            - record_encoding (optional)
            - record_format (required, block):
                - mapping_parameters (optional, block):
                    - csv (optional, block):
                        - record_column_delimiter (required)
                        - record_row_delimiter (required)
                    - json (optional, block):
                        - record_row_path (required)
        - table_name (required)
EOT

  type = map(object({
    name              = string
    code              = optional(string)
    description       = optional(string)
    region            = optional(string)
    start_application = optional(bool)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    cloudwatch_logging_options = optional(object({
      log_stream_arn = string
      role_arn       = string
    }))
    inputs = optional(object({
      kinesis_firehose = optional(object({
        resource_arn = string
        role_arn     = string
      }))
      kinesis_stream = optional(object({
        resource_arn = string
        role_arn     = string
      }))
      name_prefix = string
      parallelism = optional(object({
        count = optional(number)
      }))
      processing_configuration = optional(object({
        lambda = object({
          resource_arn = string
          role_arn     = string
        })
      }))
      schema = object({
        record_columns = list(object({
          mapping  = optional(string)
          name     = string
          sql_type = string
        }))
        record_encoding = optional(string)
        record_format = object({
          mapping_parameters = optional(object({
            csv = optional(object({
              record_column_delimiter = string
              record_row_delimiter    = string
            }))
            json = optional(object({
              record_row_path = string
            }))
          }))
        })
      })
      starting_position_configuration = optional(list(object({
        starting_position = optional(string)
      })))
    }))
    outputs = optional(list(object({
      kinesis_firehose = optional(object({
        resource_arn = string
        role_arn     = string
      }))
      kinesis_stream = optional(object({
        resource_arn = string
        role_arn     = string
      }))
      lambda = optional(object({
        resource_arn = string
        role_arn     = string
      }))
      name = string
      schema = object({
        record_format_type = string
      })
    })))
    reference_data_sources = optional(object({
      s3 = object({
        bucket_arn = string
        file_key   = string
        role_arn   = string
      })
      schema = object({
        record_columns = list(object({
          mapping  = optional(string)
          name     = string
          sql_type = string
        }))
        record_encoding = optional(string)
        record_format = object({
          mapping_parameters = optional(object({
            csv = optional(object({
              record_column_delimiter = string
              record_row_delimiter    = string
            }))
            json = optional(object({
              record_row_path = string
            }))
          }))
        })
      })
      table_name = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.kinesis_analytics_applications : (
        v.inputs == null || (length(v.inputs.schema.record_columns) >= 1 && length(v.inputs.schema.record_columns) <= 1000)
      )
    ])
    error_message = "Each record_columns list must contain between 1 and 1000 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_analytics_applications : (
        v.outputs == null || (length(v.outputs) <= 3)
      )
    ])
    error_message = "Each outputs list must contain at most 3 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_analytics_applications : (
        v.reference_data_sources == null || (length(v.reference_data_sources.schema.record_columns) >= 1 && length(v.reference_data_sources.schema.record_columns) <= 1000)
      )
    ])
    error_message = "Each record_columns list must contain between 1 and 1000 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_analytics_applications : (
        v.code == null || (length(v.code) >= 0 && length(v.code) <= 102400)
      )
    ])
    error_message = "must be between 0 and 102400 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_analytics_applications : (
        v.inputs == null || (v.inputs.parallelism == null || (v.inputs.parallelism.count == null || (v.inputs.parallelism.count >= 1 && v.inputs.parallelism.count <= 64)))
      )
    ])
    error_message = "must be between 1 and 64"
  }
  # Note: 25 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

