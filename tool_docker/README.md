


# to clean up the whole system 
```  $/> docker system prune -a ``` 

# Build a dockerfile and create a image  
```$/> docker build -t <tag_name .```

# To Run a container from a image 
```$/> docker run -it --init --publish <host_port> : <container_port> <image_name>:latest ```

# Bind mount 
- Setup the project and create Dockerfile 
- Dockerized the file and make it image using
 ```$/> docker build -t <name_of_the_image> <path> or .```  --> create a image
- Run the container from image using
```$/> docker run -it --init --publish <host_port> : <container_port> <image_name>:latest ```

- To reflect the changes has been done or made on local machine to container or to see those changes on container we have to map which directory docker has to keep on checking.
- Bind mount command
```$/> docker run -it --init --publish <host_port>:<container_port> -v ${pwd}:/host_machine_path_given_on_file  <image_name>:latest ```

- => to install vim in linux debian 
- go inside bash shell
` $/> apt-get install vim`

# Docker volume
- Volumes provide you to manage corresponding store data inside container.
- Data can store in container itself and it can persist once the container is remove or replace.
- Important data is retained and backup the data or store the data.

- Dependencies copy from MAC or WINDOWS to inside LINUX distribution which is base configuration in Container so these can give issues.
    complexity can be there.
- We don't want copy of node_modules/ in container, node_modules/ should persist there.

- To solve this , create a volume
```$/> docker volume create <project_name_node_module>```
```Ex :  docker volume create flight_service_node_modules```
- run it
```$/> docker run -it --init --publish <host_port>:<container_port>  -v "$(pwd)":/host_machine_path_given_on_file -v <volume_label_name>:/host_machine_path_given_on_file/node_modules  <image_name>:latest ```

```$/> docker run -it --init --publish 4000:3000 -v "$(pwd)":/Developer/nodejs/flight-service -v flight_service_node_modules:/Developer/nodejs/flight-service/node_modules  flight_service_img:latest ```