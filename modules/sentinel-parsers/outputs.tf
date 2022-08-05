output "ids" {
  description = "A map of function aliases to their corresponding unique identifiers."
  value       = tomap({ for name, parser in module.function : name => parser.id })
}
