variable "repo_list" {
  type = map(object({
    repo_name                  = string
    repo_files_map             = optional(map(object({file_to_commit = optional(string,""), path_to_commit =  optional(string,".")})),{})
  }))
}