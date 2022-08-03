# Overview

docker: an open source platform for developing, shipping and running applications within containers

container: a standard unit of loosely isolated environment for distributing and testing application

## docker architecture
client-server architecture:
- client: docker client, docker compose
- server: docker daemon

## docker daemon
listens for Docker API requests and manages Docker objects such as imgaes, containers, volumes and networks

## docker client



## docker desktop
an easy to install application on Mac or Windows environment that enables you to build and share containerized apps and microservices, it includes Docker client, Docker compose, Docker daemon, docker content trust, Kubernets and Credential helper.

## docker registries

## docker objects

### images
read-only template with instructions for creating a Docker container

## Create and share a Docker app

create and run containers, presist data, and deploy the containerized app to Azure:
1. create and deploy docker app
2. update and share the containerized app

docker: a standard container provider and container management system

container: compact virtualized environments, aka a process, like VM, to provide a platform for building and running app

docker-desktop: runs on your computer and manage local containers

vs-code-extension-(docker&remote-container): let you work with a local Docker Desktop service:
- create containerized app
- deploy apps to containers
- debug apps running on your containers

### Create a container

container: a process that's isolated from other processes on the host computer, it uses an isolated filesystem

filesystem: provided by a container image

image: 
- contains everything needed to run an application, such as all dependencies, source code, configurations, scripts and binaries
- contains Dockerfile or docker-compose.yml

dockerfile:contains instructions for creating a Docker container

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
