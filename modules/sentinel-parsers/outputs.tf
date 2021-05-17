output "parser_id" {
  description = "The unique identifier of the parser function."

  value = {
    id = [for file in local.files : module.function[file] if(length(regexall("\\/Quantum_.*\\.kql$", file)) > 0 && length(regexall("^uncategorized", file)) == 0)][0].id
  }
}
