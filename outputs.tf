output "kinesis_analytics_applications_id" {
  description = "Map of id values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => v.id if v.id != null && length(v.id) > 0 }
}
output "kinesis_analytics_applications_arn" {
  description = "Map of arn values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "kinesis_analytics_applications_cloudwatch_logging_options" {
  description = "Map of cloudwatch_logging_options values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => one(v.cloudwatch_logging_options) if v.cloudwatch_logging_options != null && length(v.cloudwatch_logging_options) > 0 }
}
output "kinesis_analytics_applications_code" {
  description = "Map of code values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => v.code if v.code != null && length(v.code) > 0 }
}
output "kinesis_analytics_applications_create_timestamp" {
  description = "Map of create_timestamp values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => v.create_timestamp if v.create_timestamp != null && length(v.create_timestamp) > 0 }
}
output "kinesis_analytics_applications_description" {
  description = "Map of description values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => v.description if v.description != null && length(v.description) > 0 }
}
output "kinesis_analytics_applications_inputs" {
  description = "Map of inputs values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => one(v.inputs) if v.inputs != null && length(v.inputs) > 0 }
}
output "kinesis_analytics_applications_last_update_timestamp" {
  description = "Map of last_update_timestamp values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => v.last_update_timestamp if v.last_update_timestamp != null && length(v.last_update_timestamp) > 0 }
}
output "kinesis_analytics_applications_name" {
  description = "Map of name values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => v.name if v.name != null && length(v.name) > 0 }
}
output "kinesis_analytics_applications_outputs" {
  description = "Map of outputs values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => v.outputs if v.outputs != null && length(v.outputs) > 0 }
}
output "kinesis_analytics_applications_reference_data_sources" {
  description = "Map of reference_data_sources values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => one(v.reference_data_sources) if v.reference_data_sources != null && length(v.reference_data_sources) > 0 }
}
output "kinesis_analytics_applications_region" {
  description = "Map of region values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => v.region if v.region != null && length(v.region) > 0 }
}
output "kinesis_analytics_applications_start_application" {
  description = "Map of start_application values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => v.start_application if v.start_application != null }
}
output "kinesis_analytics_applications_status" {
  description = "Map of status values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => v.status if v.status != null && length(v.status) > 0 }
}
output "kinesis_analytics_applications_tags" {
  description = "Map of tags values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "kinesis_analytics_applications_tags_all" {
  description = "Map of tags_all values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "kinesis_analytics_applications_version" {
  description = "Map of version values across all kinesis_analytics_applications, keyed the same as var.kinesis_analytics_applications"
  value       = { for k, v in aws_kinesis_analytics_application.kinesis_analytics_applications : k => v.version if v.version != null }
}

