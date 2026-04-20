variable "repo_list" {
  type = map(object({
    repo_name   = string
    env_details_map = optional(map(object({
      env_vars            = optional(map(string), {})   # Map consisting of env variables and their values
    })), {})
    repo_files_map = optional(map(object({
      file_to_commit = optional(string, ""),  # file if any to commit in the repo
      path_to_commit = optional(string, "."), # path where the file will be saved in the repo
      value_to_replace = optional(object({    # values to be replaced in the template file
        common_replace_val    = optional(map(string), {}),
        env_level_replace_val = optional(list(map(string)), [])
      }), {})
    })), {})
  }))
}