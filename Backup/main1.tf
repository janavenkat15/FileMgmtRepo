# Configure the GitHub Provider
provider "github" {
  token = "1234"
}

locals {
  # to flatten the repo_list map structure to generate repo - env - team mapping
  repo_env_flatten = flatten([
    for repo_name, envs in var.repo_list : [
      for env_name, team in envs.env_details_map :
      {
        repo_name   = envs.repo_name
        env_name    = env_name
        tag_pattern = team.tag_pattern
      }
    ]
    ]
  )
}
# Creating new github repo environment
resource "github_repository_environment" "repo_environment" {
  for_each = {
    for RepoEnvDetails in local.repo_env_flatten : "${RepoEnvDetails.repo_name}.${RepoEnvDetails.env_name}" => RepoEnvDetails
  }
  environment = each.value.env_name
  repository  = each.value.repo_name
  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = true
  }
}


resource "terraform_data" "tags_policy_maintain" {
  for_each = {
    for RepoEnvDetails in local.repo_env_flatten : "${RepoEnvDetails.repo_name}.${RepoEnvDetails.env_name}" => RepoEnvDetails
  }
  provisioner "local-exec" {
    command = "./bin/create_tag_policy.sh ${each.value.repo_name} ${each.value.env_name} ${each.value.tag_pattern} }"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "./bin/delete_tag_policy.sh ${each.value.repo_name} ${each.value.env_name}"
  }
  triggers_replace = [terraform_data.provisioner_invoke["${each.value.repo_name}.${each.value.env_name}"]]
  depends_on       = [github_repository_environment.repo_environment]
}

resource "terraform_data" "provisioner_invoke" {
  for_each = {
    for RepoEnvDetails in local.repo_env_flatten : "${RepoEnvDetails.repo_name}.${RepoEnvDetails.env_name}" => RepoEnvDetails
  }
  input = each.value.tag_pattern
}


