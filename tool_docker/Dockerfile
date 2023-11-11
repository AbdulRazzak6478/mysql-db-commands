# API-GATEWAY file code 

FROM node

WORKDIR /c/Users/ABDUL RAZZAK/Desktop/node-backend/node_start/Auth-gateway

COPY . .

RUN npm ci

CMD ["npm","run","dev"]

# FlightService
FROM node

WORKDIR /c/Users/ABDUL RAZZAK/Desktop/node-backend/node_start/FlightService

COPY . .

RUN npm ci

CMD ["npm","run","dev"]

# to clean up the whole system 
# $/> docker system prune -a

# Bind mount
# 1. Dockerfile created
# 2. Dockerized the file and make it image using
#    $/> docker build -t <name_of_the_image> <path> or .  --> create a image