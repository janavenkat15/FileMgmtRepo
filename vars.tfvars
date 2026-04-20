repo_list = {
  FileUploadRepo = {
    repo_name = "FileUploadRepo",
    repo_files_map = {
      CrossRegionDeploy = {
        file_to_commit = "ActionTemplateFiles/Cross-Region-Deploy.yml"
        path_to_commit = ".github/workflows/Manual-Deployment.yml"
        value_to_replace = {
          env_level_replace_val = [
            {
              "environment" = "DEV"
              "dbregions"   = "['DEVAP','DEVCA','DEVEU','DEVME','DEVUS']"
            },
            {
              "environment" = "QA"
              "dbregions"   = "['QAAP','QACA','QAEU','QAME','QAUS']"
            },
            {
              "environment" = "UAT"
              "dbregions"   = "['UATAP','UATCA','UATEU','UATME','UATUS']"
            },
            {
              "environment" = "RELEASEQA"
              "dbregions"   = "['RELEASEQAUS']"
            },
            {
              "environment" = "DCRELEASEQA"
              "dbregions"   = "['DCRELEASEQAAP','DCRELEASEQAEU','DCRELEASEQAME','DCRELEASEQASA']"
            },
            {
              "environment" = "DCPROD"
              "dbregions"   = "['DCPRODAP','DCPRODEU','DCPRODME','DCPRODSA']"
            },
          ]
        }
      }
      CrossCountryDeploy = {
        file_to_commit = "ActionTemplateFiles/Cross-Countries-Deploy.yml"
        path_to_commit = ".github/workflows/Cross-Countries-Deploy.yml"
        value_to_replace = {
          env_level_replace_val = [
            {
              "dbregion"    = "DEVAP"
              "dbcountries" = "['DEVAP-in']"
            },
            {
              "dbregion"    = "DEVCA"
              "dbcountries" = "['DEVCA-ca']"
            },
            {
              "dbregion"    = "DEVEU"
              "dbcountries" = "['DEVEU-itis']"
            },
            {
              "dbregion"    = "DEVME"
              "dbcountries" = "['DEVME-sa']"
            },
            {
              "dbregion"    = "DEVUS"
              "dbcountries" = "['DEVUS-us']"
            },
            {
              "dbregion"    = "QAAP"
              "dbcountries" = "['TESTAP-in']"
            },
            {
              "dbregion"    = "QACA"
              "dbcountries" = "['TESTCA-ca']"
            },
            {
              "dbregion"    = "QAEU"
              "dbcountries" = "['TESTEU-itis','TESTEU-fr','TESTEU-dk','TESTEU-fi']"
            },
            {
              "dbregion"    = "QAME"
              "dbcountries" = "['TESTME-sa']"
            },
            {
              "dbregion"    = "QAUS"
              "dbcountries" = "['TESTUS-us','TESTUS-br','TESTUS-it']"
            },
            {
              "dbregion"    = "UATAP"
              "dbcountries" = "['UATAP-in']"
            },
            {
              "dbregion"    = "UATCA"
              "dbcountries" = "['UATCA-ca']"
            },
            {
              "dbregion"    = "UATEU"
              "dbcountries" = "['UATEU-itis']"
            },
            {
              "dbregion"    = "UATME"
              "dbcountries" = "['UATME-sa']"
            },
            {
              "dbregion"    = "UATUS"
              "dbcountries" = "['UATUS-us']"
            },
            {
              "dbregion"    = "RELEASEQAUS"
              "dbcountries" = "['RELEASETESTUS-us']"
            },
            {
              "dbregion"    = "DCRELEASEQAAP"
              "dbcountries" = "['DCRELEASETESTAP-in']"
            },
            {
              "dbregion"    = "DCRELEASEQAEU"
              "dbcountries" = "['DCRELEASETESTEU-it','DCRELEASETESTEU-fr']"
            },
            {
              "dbregion"    = "DCRELEASEQAME"
              "dbcountries" = "['DCRELEASETESTME-sa']"
            },
            {
              "dbregion"    = "DCRELEASEQASA"
              "dbcountries" = "['DCRELEASETESTSA-br']"
            },
            {
              "dbregion"    = "DCPRODAP"
              "dbcountries" = "['DCPRODAP-in']"
            },
            {
              "dbregion"    = "DCPRODEU"
              "dbcountries" = "['DCPRODEU-it','DCPRODEU-fr','DCPRODEU-dk','DCPRODEU-fi','DCPRODEU-ch']"
            },
            {
              "dbregion"    = "DCPRODME"
              "dbcountries" = "['DCPRODME-sa']"
            },
            {
              "dbregion"    = "DCPRODSA"
              "dbcountries" = "['DCPRODSA-br']"
            },

          ]
        }
      }
      Deploy = {
        file_to_commit = "ActionTemplateFiles/DBMigration-Deployer.yml"
        path_to_commit = ".github/workflows/DBMigration-Deployer.yml"
        value_to_replace = {
          common_replace_val = {
            "ecrRepositoryName" = "isage-db-migration",
            "tableName"         = "sqlScriptExec",
            "globalEnvName"     = "NONPROD-GLOBAL"
          }
        }
      }
      DevConJson = {
        file_to_commit = "AdditionalTempFiles/devcontainer.tftpl"
        path_to_commit = ".devcontainer/devcontainer.json"
        value_to_replace = {
          common_replace_val = {
            "repoName" = "common-infra"
          }
        }
      }
      DevConEnv = {
        file_to_commit = "AdditionalTempFiles/devcontainer.env"
        path_to_commit = ".devcontainer/devcontainer.env"
      }
      DevConDocker = {
        file_to_commit = "AdditionalTempFiles/Dockerfile"
        path_to_commit = ".devcontainer/Dockerfile"
      }
      Dependabot = {
        file_to_commit = "AdditionalTempFiles/dependabot.yml"
        path_to_commit = ".github/dependabot.yml"
        value_to_replace = {
          env_level_replace_val = [
            {
              "directory"    = "/Application/"
              "ghadirectory" = "/"
            },
            {
              "directory"    = "/Account/"
              "ghadirectory" = ""
            }
          ]
        }
      }
      CrossRegionInfra = {
        file_to_commit = "ActionTemplateFiles/Infra-plan-Across-Regions.yml"
        path_to_commit = ".github/workflows/Infra-plan-Across-Regions.yml"
        value_to_replace = {
          env_level_replace_val = [
            {
              "environment"  = "DEV"
              "infraregions" = "['DEVUSEast1','DEVEUCentral1','DEVMESouth1','DEVAPSouth1']"
            },
            {
              "environment"  = "QA"
              "infraregions" = "['QAUSEast1','QAEUCentral1','QAMESouth1','QAAPSouth1']"
            },
            {
              "environment"  = "UAT"
              "infraregions" = "['UATUSEast1','UATEUCentral1','UATMESouth1','UATAPSouth1']"
            }
          ]
        }
      },
      Infra-Plan = {
        file_to_commit = "ActionTemplateFiles/Infra-plan.yml"
        path_to_commit = ".github/workflows/Infra-plan.yml"
      },
      Application-Infra = {
        file_to_commit = "ActionTemplateFiles/Infra-plan-&-apply-master.yml"
        path_to_commit = ".github/workflows/Application-Infra.yml"
        value_to_replace = {
          common_replace_val = {
            working-directory = "Repo/Application"
          },
          env_level_replace_val = [
            {
              environment  = "DEVEUCentral1",
              account-id   = "424114987786",
              aws-region   = "eu-central-1",
              var-file     = "dev-eu-central-1-env-var.tfvars",
              backend-file = "dev-eu-central-1-backend.hcl",
              vpn-enabled  = "true"
            },
            {
              environment  = "DEVMESouth1",
              account-id   = "424114987786",
              aws-region   = "me-south-1",
              var-file     = "dev-me-south-1-env-var.tfvars",
              backend-file = "dev-me-south-1-backend.hcl",
              vpn-enabled  = "true"
            },
            {
              environment  = "DEVUSEast1",
              account-id   = "424114987786",
              aws-region   = "us-east-1",
              var-file     = "dev-us-east-1-env-var.tfvars",
              backend-file = "dev-us-east-1-backend.hcl",
              vpn-enabled  = "true"
            },
            {
              environment  = "TESTEUCentral1",
              account-id   = "424114987786",
              aws-region   = "eu-central-1",
              var-file     = "qa-eu-central-1-env-var.tfvars",
              backend-file = "qa-eu-central-1-backend.hcl",
              vpn-enabled  = "true"
            },
            {
              environment  = "TESTMESouth1",
              account-id   = "424114987786",
              aws-region   = "me-south-1",
              var-file     = "qa-me-south-1-env-var.tfvars",
              backend-file = "qa-me-south-1-backend.hcl",
              vpn-enabled  = "true"
            },
            {
              environment  = "TESTUSEast1",
              account-id   = "424114987786",
              aws-region   = "us-east-1",
              var-file     = "qa-us-east-1-env-var.tfvars",
              backend-file = "qa-us-east-1-backend.hcl",
              vpn-enabled  = "true"
            }
          ]
        }
      },
      All-Products-Infra = {
        file_to_commit = "ActionTemplateFiles/All-Products-Infra-Trigger.yml"
        path_to_commit = ".github/workflows/All-Products-Infra.yml"
        value_to_replace = {
          env_level_replace_val = [
            {
              infrarepo = "pfizer_infra_setup"
            },
            {
              infrarepo = "gbcc_infra_setup"
            },
            {
              infrarepo = "gvhd_infra_setup"
            }
          ]
        }
      }
    }
  }
}
