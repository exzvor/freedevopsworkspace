#!/bin/bash
echo "Previous containers are deleting"
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -aq)

echo "Build and run db container"
docker build -t db /home/user/app/db
docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=your_password --network=appnetwork db

echo "Build and run app container"
docker build -t app /home/user/app/backend
docker run -d -p 8080:8080 --network=appnetwork app

echo "Build and run react container"
docker build -t react-app /home/user/app/react-app
docker run -d -p 80:80 --network=appnetwork react-app

echo "Your app is ready"