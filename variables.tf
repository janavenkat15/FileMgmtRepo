variable "repo_list" {
  type = map(object({
    repo_name                  = string
    files_to_commit            = optional(list(string),[])
  }))
}