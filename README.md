# learn-docker
## Create and share a Docker app

create and run containers, presist data, and deploy the containerized app to Azure:
1. create and deploy docker app
2. update and share the containerized app


container: compact virtualized environments, aka a process, like VM, to provide a platform for building and running app

docker: standard container provider and container management system

docker-desktop: runs on your computer and manage local containers

vs-code-extension-(docker&remote-container): let you work with a local Docker Desktop service:
- create containerized app
- deploy apps to containers
- debug apps running on your containers

### Create a container

container: a process taht's isolated from other processes on the host computer, it uses an isolated filesystem
filesystem: provided by a container image
image:
- contains everything needed to run an application, such as all dependencies, source code, configurations, scripts and binaries
- contains Dockerfile or docker-compose.yml

dockerfile:contains configuration for the container image

#### Docker commands

pull an image from the registry and run the image:

`docker run -d -p 80:80 docker/getting-started`

This command contains the following parameters:
- -d -run the container in detached mode (in background)
- -p 80:80 -map `<host-port>` to `<container-port>`
- docker/getting-started -the image to use

to stop and remove a container:

`docker stop <container-id>`
`docker rm <container-id>`

### Build a container image for the app

to build an image for an app, we need a Dockerfile, then run the following command to build a container image

`docker build -t <tagAsFriendlyimageName> <host-path-where-to-find-dockerfile>`




### Start an app container
### Update the code and replace the container
### Share your image
### Run the image on a new instance
### Clean up resources
