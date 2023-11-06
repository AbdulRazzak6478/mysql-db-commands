FROM node 

WORKDIR /Developer/demo_docker_comtainer

COPY . .

RUN npm ci

CMD ["npm","start"]

# to clean up the whole system 
# $/> docker system prune -a

# Bind mount
# 1. Dockerfile created
# 2. Dockerized the file and make it image using
#    $/> docker build -t <name_of_the_image> <path> or .  --> create a image