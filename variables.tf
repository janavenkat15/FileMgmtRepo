variable "repo_list" {
  type = map(object({
    repo_name = string
    repo_vars = optional(map(string), {})
    archived  = optional(bool, false)
    env_details_map = optional(map(object({
      job_approvers       = optional(list(string), []), # Team ID of OrgProdApprovers-10595666, OrgQAApprovers=10595667, devops-3764060, avhanaETL-4940399
      deployment_branches = optional(list(string), []), # List of branches from which deployment to env is allowed
      env_vars            = optional(map(string), {})   # Map consisting of env variables and their values
      tag_pattern         = optional(list(string), [])  # List of tag patterns only from which deployment can happen
    })), {})
    sonarqube_qualitygate_name = optional(string, "")
    default_branch_name        = optional(string, "master") # for setting default branch for the repo
    repo_files_map = optional(map(object({
      file_to_commit = optional(string, ""),           # file if any to commit in the repo
      path_to_commit = optional(string, "."),          # path where the file will be saved in the repo
      value_to_replace = optional(object({             # values to be replaced in the template file
        DeployGlobalNonProdDB  = optional(bool, true)  # contains non prod global db environment
        DeployDWH              = optional(bool, false) # deployment to DWH
        common_replace_val     = optional(map(string), {}),
        env_level_replace_val  = optional(list(map(string)), [])
        DevConCommonInfraClone = optional(bool, true) # Decide to Clone Common infra repo in Dev container
        db_migration_cmd       = optional(string, "") # DB migration related values
      }), {})
    })), {})
  }))
}
