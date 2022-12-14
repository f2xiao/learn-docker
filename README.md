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

`docker run -dp <host-port>:<container-port> -v <volume-name>:<container-data-path> <imageTagName>`

`docker volume inspect <volume-name>`

`docker run -dp <host-port>:<container-port> -v <host-data-path>:<container-data-path> <imageTagName>`

`docker run -dp <host-port>:<container-port> -w <WORKDIR> -v ${PWD}:<WORKDIR> <imageTagName> sh -c "npm install && npm run dev"`

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
the primary way that Docker user interact with the Docker, when docker user types docker CLI commands, docker client communicates with docker daemon to pass on the requests for docker daemon to execute them.

## docker desktop
an easy to install application on Mac or Windows environment that enables you to build and share containerized apps and microservices, it includes Docker client, Docker compose, Docker daemon, docker content trust, Kubernets and Credential helper.

## docker registries
docker registry stores docker image, places for users to share images

## docker objects

Docker objects include:
- image
- container
- network
- volume
- plugin

### images
read-only template with instructions for creating a Docker container

it contains everything needed to run an application, such as all dependencies, source code, configurations, scripts and binaries
 
to create an image, we need either a Dockerfile or docker-compose.yml

### container
a runnable instance of an image

it's a process that's isolated from other processes on the host computer, it uses an isolated filesystem

filesystem: provided by a container image

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

### NOTE about containers 
Containers are not meant to host an OS. It is meant to run a specific task or process:
- host an instance of a web server or app or a database
- carry out some computation or analysis

Examples:
1. Ubuntu image uses bash as default command:
`CMD ['bash']`

    NOTE: bash is not really a process, it's a shell taht listens inputs from a terminal. By default, docker doesn't attach a terminal to a container, since bash cannot find the terminal, it exits so the container is no longer running a process so it exits as well.

2. Nginx
`CMD ['nginx']`

3. Mysql
`CMD ['mysqld']`


## Docker commands

### specify a process when starts a container
Two ways to define the process to be running when a container is started:
1. append the command with the docker run command
    
    `docker run [command] [parms]`
    it overwrites the `CMD ["command","parm1"]` in the Dockerfile

2. instruction `CMD` in the Dockerfile

    NOTE: the param1 is fixed in this case, not very good

    SOLUTION: `ENTRYPOINT ["command"]`

        it specifies which program will be running when the container starts and any params entered with the `docker run [imgName] [param1]` will get appended to the entry point.

Examples:
```
FROM Ubuntu
CMD sleep 5
```

```
FROM Ubuntu
ENTRYPOINT ["sleep"]
```

```
FROM Ubuntu
ENTRYPOINT ["sleep"]
CMD ["5"]
```

to override the entrypoint use options `--entrypoint [newcommand]`

`docker run --entrypoint [newcommand] [imgName] [param1]`
### CMD vs ENTRYPOINT

Since containers are meant to run a specific task or process, we can use the `CMD` or `ENTRYPOINT` instruction in the Dockerfile to define what task or process is running when it starts.

## Docker network

Docker creates 3 networks automatically when it's installed: bridge, host and none.

bridge allows containers to communicates with each other.

none doesn't allow container to commucate with other containers.

host let the container to use the networks on the host.

Exercises:

`docker run --name mysql-db --network=wp-mysql-network -e MYSQL_ROOT_PASSWORD=db_pass123 mysql:5.6`

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

### Cache dependencies

#### layer in the image
A Docker image consists of read-only layers each of which represents a Dockerfile instruction. The layers are stacked and each one is a delta of the changes from the previous layer. 

(When you run an image and generate a container, you add a new writable layer (the ???container layer???) on top of the underlying layers. All changes made to the running container, such as writing new files, modifying existing files, and deleting files, are written to this writable container layer.)

Once a layer changes, all downstream layers have to be recreated as well. So we don't want any code changes in the app code (excludes the app dependencies, i.e all source code files excluding the package.json file) to trigger the recreation of the app dependencies layer( i.e. package.json file) so the source code layer should be created after the app dependencies layer is created.

When build a image with the dockerfile, cache happens with each layer in the image and docker will use cache as much as possible if no changes made in each layer.
 
So if the app code is copied into the container before installing app dependencies, any changes in the app code will trigger new installation of app dependencies, which significantly slow down the time to re-build the container.
 
So we want the app dependencies layer to be created before the app code layer:

1. prepare dockerfile as following:
 ```
 FROM node:12-alpine
 WORKDIR /app
 COPY package.json yarn.lock ./
 RUN yarn install --production 
 COPY . .
 CMD ["node", "/app/src/index.js"]
```
make sure the package.json file contains nodemon so the app restarts after code changes
 
2. build the image
`docker build -t <imagetagname> .`

3. run the image and run the command to install dependencies
 `docker run -dp <host-port>:<container-port> -w <WORKDIR> -v ${PWD}:<WORKDIR> sh -c "yarn install && yarn run dev" `

NOTE: when use `-v ${PWD}:<WORKDIR>` the `<WORKDIR>` in the container will be overwrite byy the `${PWD}` so the `node_module/` created during the image build process will be deleted if there is no `node_module/` in the `${PWD}` on the host.
 
### Multi-stage builds

#### React example
```
 # stage 1: node environment
 # base image: node
 FROM
 WORKDIR
 # app dependencies
 COPY
 RUN
 # static html and css
 COPY
 # app code
 COPY
 # compile JS, SASS into static JS, hmtl and css 
 RUN
 
 # stage 2: production environment
 # base imgae: nginx
 FROM
 # compiled JS, html and css
 COPY --from=build <host-path> <container-path>
```
## Deploy app to Azure
 
1. create an Azure Container Instance Context: newcontextname->resourcegroup

the ACI context will show under CONTEXTS

2. Use the ACI context
 
`docker use <newacicontext-name>`
 
3.run the remote image in the cloud from hub.docker.com

`docker run -dp <host-port>:<container-port> registry.<website-name>/<username>/<imageTagName>`
 
`docker run -dp <host-port>:<container-port> registry.hub.docker.com/<username>/<imageTagName>`
 
`docker run -dp <host-port>:<container-port> registry.hub.docker.com/library/<imageTagName>`

