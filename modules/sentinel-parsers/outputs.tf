output "parser_id" {
  description = "The unique identifier of the parser function."

  value = {
    parser = local.files
    id     = [for file in local.files : module.function[file]][0].id
  }
}
