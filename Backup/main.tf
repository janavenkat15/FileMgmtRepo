# Configure the GitHub Provider
provider "github" {
  token = "1234"
}

locals {
  # flatten ensures that this local value is a flat list of objects, rather
  # than a nested map of objects.
  repo_files_flat = flatten([
    for repo_key, repo_details in var.repo_list : [
      for repo_file_key, file in repo_details.repo_files_map : {
        repo_name        = repo_details.repo_name
        repo_file_key    = "${repo_key}-${repo_file_key}"
        file_name        = file.file_to_commit
        path             = file.path_to_commit
        value_to_replace = file.value_to_replace
      }
    ]
  ])
}


resource "github_repository_file" "create_file" {
  for_each = {
    for RepoFileDetails in local.repo_files_flat : "${RepoFileDetails.repo_file_key}" => RepoFileDetails
  }
  repository          = each.value.repo_name
  file                = each.value.path
  content             = templatefile("${path.module}/${each.value.file_name}", each.value.value_to_replace)
  overwrite_on_create = true
}
