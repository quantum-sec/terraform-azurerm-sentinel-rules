output "ids" {
  description = "A map of function aliases to their corresponding unique identifiers."
  value       = tomap({ for name, schema in module.function : name => schema.id })
}
