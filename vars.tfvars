repo_list = {
  FileUploadRepo = {
    repo_name        = "FileUploadRepo",   
    repo_files_map = {
      file1 = {
          file_to_commit = "Dockerfile"
          path_to_commit = "folder1/folder2"
      }
    }
  }
  TestDependabotRepo = {
    repo_name        = "TestDependabotRepo",
    repo_files_map = {
      file1 = {
          file_to_commit = "Dockerfile"
      }
      file2 = {
          file_to_commit = "dependabot.yml"
          path_to_commit = ".github/workflows"
      }
    }
  }
  FileMgmtRepo = {
    repo_name        = "FileMgmtRepo"
  }
}