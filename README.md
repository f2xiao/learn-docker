# Cheatsheet

`docker build -t <imageTagName> <host-path-that-contains-dockerfile>`

`docker run -dp <host-port>:<container-port> <imageTagName>`

`docker ps`

`docker stop <container-id>`

`docker rm <container-id>`

`docker login -u <username>`

`docker tag <local-image:tagname> <docker-hub-namespace>/repo-name:tagname`

`docker push <docker-hub-namespace>/repo-name:tagname`

`docker create volume <volume-name>`

`docker run -dp <host-port>:<container-port> -v <volume-name>:<container-data-path>`

`docker volume inspect <volume-name>`

`docker run -dp <host-port>:<container-port> -v <host-data-path>:<container-data-path>`

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
the primary way that Docker user interact with the Docker, whendDocker user types docker CLI commands, docker client communicates with docker daemon to pass on the requests for docker daemon to execute them.

## docker desktop
an easy to install application on Mac or Windows environment that enables you to build and share containerized apps and microservices, it includes Docker client, Docker compose, Docker daemon, docker content trust, Kubernets and Credential helper.

## docker registries
docker registry stores docker image, places for users to share images

## docker objects

### images
read-only template with instructions for creating a Docker container

### container
a runnable instance of an image

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

`docker run -dp <host-port>:<container-port> <imagetagname> `

### Update the code and replace the container

stop and remove the old container then build the updated version of the image and start a new container with the updated image

### Share your image
1. login to the docker hub 

`docker login -u <username>`

2. create a repo with <repoName>, then rename your local image with the same name as the <username>/<repoName>

 `docker tag local-image:tagname new-repo:tagname`
  
3. push your local image to the docker hub
  
 `docker push new-repo:tagname` i.e. `docker push <username>/<repoName>`

### Run the image on a new instance
1. open browser to play with docker
2. sign in to you docker hub
3. use commands to run an image from your namespace on docker hub
 
## Presist data in a container app
two ways to presist data: named volumes and bind mounts
 
data: represents the file data, including the source code(database file), dockfile, etc...

### Use named volumes
 
volume/named volume: a named logical area of the physical disk
Docker maintains the physical location the volume is on the disk, refers to the name of the volume, and docker provides the right data:
 
 1. create a volume
 `docker create volume <volume-name>`
 
 2. specify the volume with its name to be mounted on the location with container folder path
 
 `docker run -dp <host-port>:<container-port> -v <volume-name>:<container-path> <image-tag-name>`
 
 sync  <container-path> to <volume-name> (named volume) or sync <container-path> to <host-path> (bind mounts)
 
 3. inspect the data
 
 `docker volume inspect <volume-name>`
 
### Use bind mounts
bind mounts syncs `<container-path>` to a mountpoint on the host, aka `<host-path>`

benefits: provide more data into containers

usage senario: use a bind mount to mount source code on the host into the container with `-v <host-mountpoint>:<container-path>` while run the image (create a container), make some code changes in the host source code file, docker will automatically detect the changes, and rebuid and re-run the image with the updated files


 

 
 

