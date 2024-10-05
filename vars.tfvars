repo_list = {
  # FileUploadRepo = {
  #   repo_name = "FileUploadRepo",
  #   env_details_map = {
  #     TEST = {
  #       tag_pattern = "deploy__DEV*",
  #     },
  #     UAT = {
  #       tag_pattern = "deploy__TEST*"
  #     }
  #   }
  # }
  FileUploadRepo = {
    "repo_name" = "FileUploadRepo",
    repo_files_map = {
      Infra-Plan = {
        file_to_commit = "ActionTemplateFiles/Infra-plan.yml"
        path_to_commit = ".github/workflows/Infra-plan.yml"
      },
      Account-Infra = {
        file_to_commit = "ActionTemplateFiles/Infra-plan-&-apply-master.yml"
        path_to_commit = ".github/workflows/Account-Infra.yml"
        value_to_replace = {
          common_replace_val = {
            working-directory = "Repo/Account"
          },
          env_level_replace_val = [
            {
              environment  = "NonProdAccount",
              account-id   = "424114987786",
              aws-region   = "us-east-1",
              var-file     = "nonprod-env-var.tfvars",
              backend-file = "nonprod-backend.hcl",
              vpn-enabled  = "false"
            },
            {
              environment  = "IsageProdAccount",
              account-id   = "544549334831",
              aws-region   = "us-east-1",
              var-file     = "prod-env-var.tfvars",
              backend-file = "prod-backend.hcl",
              vpn-enabled  = "false"
            },
            {
              environment  = "DCProdAccount",
              account-id   = "709643934228",
              aws-region   = "us-east-1",
              var-file     = "dcprod-env-var.tfvars",
              backend-file = "dcprod-backend.hcl",
              vpn-enabled  = "false"
            },
          ]
        }
      }
    }
  }
}
