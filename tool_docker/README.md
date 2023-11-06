


# to clean up the whole system 
```  $/> docker system prune -a ``` 

# Build a dockerfile and create a image  
```$/> docker build -t <tag_name .```

# To Run a container from a image 
```$/> docker run -it --init --publish <host_port> : <container_port> <image_name>:latest ```

# Bind mount 
# 1. Setup the project and create Dockerfile 
# 2. Dockerized the file and make it image using
 ```$/> docker build -t <name_of_the_image> <path> or .```  --> create a image
# 3. Run the container from image using
```$/> docker run -it --init --publish <host_port> : <container_port> <image_name>:latest ```

- To reflect the changes has been done or made on local machine to container or to see those changes on container we have to map which directory docker has to keep on checking.
- Bind mount command
```$/> docker run -it --init --publish <host_port>:<container_port> -v ${pwd}:/host_machine_path_given_on_file  <image_name>:latest ```

- => to install vim in linux debian 
- go inside bash shell
` $/> apt-get install vim`

# Docker volume