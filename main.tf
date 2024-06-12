# Configure the GitHub Provider
provider "github" {
  token = "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"
}

locals{
 repo_files_map = flatten([
    for repo_name, files in var.repo_list : [
      for file_name in files.files_to_commit : {
        repo_name  = repo_name
        file_name = file_name
      }
    ]
  ])
}

 resource "github_repository_file" "create_file" {
   for_each = {
    for RepoFileDetails in local.repo_files_map : "${RepoFileDetails.repo_name}.${RepoFileDetails.file_name}" => RepoFileDetails
  }
   repository = each.value.repo_name
   branch     = "main"
   file       = each.value.file_name
   content    = file("${path.module}/common-commit-files/${each.value.file_name}")
   overwrite_on_create = true
 }