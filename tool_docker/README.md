


# to clean up the whole system 
```
  $/> docker system prune -a
 ``` 

# Build a dockerfile and create a image  
```
    $/> docker build -t <tag_name .
```

# To Run a container from a image 
```
    $/> docker run -it --init --publish <host_port> : <container_port> <image_name>:latest 
```

# Bind mount 
- Setup the project and create Dockerfile 
- Dockerized the file and create a image using
```
    $/> docker build -t <name_of_the_image> <path> or .
```
- Run the container from image using
```
    $/> docker run -it --init --publish <host_port> : <container_port> <image_name>:latest
 ```

- To reflect the changes has been done or made on local machine to container or to see those changes on container we have to map which directory docker has to keep on checking.
- Bind mount command
```
    $/> docker run -it --init --publish <host_port>:<container_port> -v ${pwd}:/host_machine_path_given_on_file  <image_name>:latest
 ```

- => to install vim in linux debian 
- go inside bash shell
- ` $/> apt-get install vim`


# Docker volume
- Volumes provide you to manage corresponding store data inside container.
- Data can store in container itself and it can persist once the container is remove or replace.
- Important data is retained and backup the data or store the data.

- Dependencies copy from MAC or WINDOWS to inside LINUX distribution which is base configuration in Container so these can give issues.
    complexity can be there.
- We don't want copy of node_modules/ in container, node_modules/ should persist there.

- To solve this , create a volume
```
    $/> docker volume create <project_name_node_module>
```
``` 
    Ex :  docker volume create flight_service_node_modules
```
- run it
```
    $/> docker run -it --init --publish <host_port>:<container_port>  -v "$(pwd)":/host_machine_path_given_on_file -v <volume_label_name>:/host_machine_path_given_on_file/node_modules  <image_name>:latest
 ```

```
    $/> docker run -it --init --publish 4000:3000 -v "$(pwd)":/Developer/nodejs/flight-service -v flight_service_node_modules:/Developer/nodejs/flight-service/node_modules  flight_service_img:latest 
```

# Communication between Microservices using Docker
- To do this technically we need to prepare a network bridge and whoever has to communicate, they has to go through this bridge.
- Bridge will be kind of like a interface between all of them which will be redirecting routes to other containers .

- Command to create a network bridge .
```
    docker network create microservices-network
```
you will get a unique `hash`, `Driver` is a additional tool required to happened this network.
Give the other service a name .
Create a volume for the `flights-service-node-modules`
```
    docker run -it --init --name flights_service -p 3000:3000 -v "$(pwd)":/developer/nodejs/flights-service -v flights-service-node-modules:/developer/nodejs/flights-service/node_modules flights-service:latest
```
- name is assign to that container, so that we can use that to refer this container in `API GATEWAY service container` , change in `.env` with required name of that container.
To similar to API-GATEWAY .
```
    docker run -it --init --name api_gateway -p 3000:3000 -v "$(pwd)":/developer/nodejs/API-GATEWAY -v API-GATEWAY-node-modules:/developer/nodejs/API-GATEWAY/node_modules api-gateway-service:latest
```
```
    docker inspect microservices-network 
```
no containers attach to it .
- Attach network to the services flights and api-gateway. 
```
    docker run -it --init --name api_gateway --network <nameOfNetwork_microservices-network> -p 3000:3000 -v "$(pwd)":/developer/nodejs/API-GATEWAY -v API-GATEWAY-node-modules:/developer/nodejs/API-GATEWAY/node_modules api-gateway-service:latest
```
To it similar for the `Booking-service`.
- create image.
- make a volume .
- create container by specifying `--name` and add into network using `--network`. similar to `flight_service`
- we can call the flight service through a api routes `/callingFlightService` and async function to call service using `axios`.

Docker Compose
- Gather your services in a folder.
- create a file name it as `docker-compose.yml`
```
    version : "3"
    networks :
        micro-net:
            driver :bridge
    volumes :
        API-GATEWAY-node-modules:
        flight-service-node-modules:
        booking-service-node-modules:
    services : 
        api_gateway:
            build : pathOfTheService_./API-GATEWAY/Dockerfile
            networks :
                - micro-net or microservice-networks
            ports : 
                - "3001:3001"
            volumes : 
                - ./API-GATEWAY:/developer/nodejs/api-gateway <!-- mount -->
                - API-GATEWAY-node-modules:/developer/nodejs/API-GATEWAY/node_modules <!-- volume -->
            environment :
        flight-service :
            build :
            networks :
                - micro-net or microservice-networks
            ports :
            volumes:
        booking_service : 
            build :
            networks :
                - micro-net or microservice-networks
            ports :
            volumes:
```
- To run docker compose , d = detach, it runs all containers in detached mode  kind of -dit flag
```
    docker compose up -d
    docker compose down
```