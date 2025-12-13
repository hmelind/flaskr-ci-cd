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
