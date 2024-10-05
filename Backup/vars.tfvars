repo_list = {
  FileUploadRepo = {
    repo_name        = "FileUploadRepo",
    env_details_map = {
      TEST-USus = {
        deployment_branches = ["master"],
        env_vars = {
          propertyFileNameWithPath = "isage/PropertyFiles/us-east-1-QA.json"
          ecsLogGroupName          = "/ecs/QA-us/isage_db_migration"
          deployerRoleARN          = "arn:aws:iam::424114987786:role/Deployer-Role-QA"
          dbDetailsFromSecret      = "/QA/isage-rds-qa"
          containerCommand         = "{\"dbScriptDirectory\":\"Automated_Change_Scripts\",\"missedScriptName\":\"dummy\"}"
        }
      },
      TEST-USbr = {
        deployment_branches = ["master"],
        env_vars = {
          propertyFileNameWithPath = "isage/PropertyFiles/us-east-1-QA.json"
          ecsLogGroupName          = "/ecs/QA-br/isage_db_migration"
          deployerRoleARN          = "arn:aws:iam::424114987786:role/Deployer-Role-QA"
          dbDetailsFromSecret      = "/QA/isage-rds-qa-br"
          containerCommand         = "{\"dbScriptDirectory\":\"Automated_Change_Scripts\",\"missedScriptName\":\"dummy\"}"
        }
      }
    }
    repo_files_map = {
      CrossRegionDeploy = {
        file_to_commit = "ActionTemplateFiles/Cross-Region-Deploy.yml"
        path_to_commit = ".github/workflows/Manual-Deployment.yml"
        value_to_replace = {
          env_level_replace_val = [
            {
              "environment" = "DEV"
              "dbregions" = "['DEVEU','DEVME']"
            },
            {
              "environment" = "QA"
              "dbregions" = "['QAUS','QAEU','QAME']"
            }
          ]
        }
      }
      CrossCountryDeploy = {
        file_to_commit = "ActionTemplateFiles/Cross-Countries-Deploy.yml"
        path_to_commit = ".github/workflows/Cross-Countries-Deploy.yml"
        value_to_replace = {

          env_level_replace_val = [
            {
              "dbregion" = "QAUS"
              "dbcountries" = "['TESTUS-us','TESTUS-br']"
            },
            {
              "dbregion" = "QAEU"
              "dbcountries" = "['TESTEU-us','TESTEU-br']"
            },
            {
              "dbregion" = "QAME"
              "dbcountries" = "['TESTME-us','TESTME-br']"
            }
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
    }
  }
}