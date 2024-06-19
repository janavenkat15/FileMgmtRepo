# Configure the GitHub Provider
provider "github" {
  token = "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"
}
locals {
  # flatten ensures that this local value is a flat list of objects, rather
  # than a nested map of objects.
  repo_files_flat = flatten([
    for repo_key, repo_details in var.repo_list : [
      for repo_file_key, files in repo_details.repo_files_map : {
        repo_name       = repo_key
        repo_file_key   = "${repo_file_key}.${repo_key}"
        file_name       = files.file_to_commit
        path            = files.path_to_commit
      }
    ]
  ])
}

 resource "github_repository_file" "create_file" {
   for_each = {
    for RepoFileDetails in local.repo_files_flat : "${RepoFileDetails.repo_file_key}" => RepoFileDetails
  }
   repository = each.value.repo_name
   branch     = "main"
   file       = "${each.value.path}/${each.value.file_name}"
   content    = file("${path.module}/common-commit-files/${each.value.file_name}")
   overwrite_on_create = true
 }
 