## Run with Docker

```bash
docker build -t flaskr-dev-env -f Dockerfile_flaskr-dev-env .
docker run -it --rm --name flaskr -v .\instance:/app/flaskr-devops/instance -p 5000:5000 flaskr-dev-env
```

## Jenkins Setup

```bash
docker build -t my_jenkins -f Dockerfile_jenkins .
docker run -it --rm -p 8080:8080 -p 50000:50000 -v .\jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock my_jenkins
```
After it starts, you can access Jenkins at 'http://localhost:8080'.
The initial admin password can be found in the Jenkins container logs.
You will need the git plugin to clone the source repository.
Create a new pipeline job and copy and paste the contents of `Jenkinsfile` into the pipeline script section.

## Terraform Setup

To setup Terraform, you need to have PowerShell profile configured. You can create or edit your PowerShell profile by running the following commands:
```bash
New-Item $profile -Type File
notepad $profile
```

Then, add the following lines to your PowerShell profile to include Terraform in your PATH:

```bash

Function Test-Elevated {
  $wid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
  $prp = New-Object System.Security.Principal.WindowsPrincipal($wid)
  $adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
  $prp.IsInRole($adm)
}

If (Test-Elevated) {

} Else {
  function terraform {
    docker run -it --rm `
        -v "${PWD}:/workspace" `
        -v //var/run/docker.sock:/var/run/docker.sock `
        -w /workspace `
        hashicorp/terraform:light `
        @args
  }
}
```
After saving the profile, restart your PowerShell session. You can now use the `terraform` command directly in PowerShell.

If during the `terraform apply` step you encounter a fail related to client API verison, you can workaround it by setting the verison in the docker `daemon.json` file located in `C:\Users\<user name>\.docker` folder. Add the following content to the `daemon.json` file:
```json
{
  "api-version": "1.41"
}
```
Then restart Docker Desktop for the changes to take effect.

