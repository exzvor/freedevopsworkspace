## Run a simple app (part 1)
[Here is an example](https://github.com/exzvor/freedevopsworkspace/tree/main/app) of simple app to run.
Your task is to create three Docker containers representing the database (named db), the Golang backend, 
and the React frontend, and configure them to interact with each other 
to display the requested data on port 80 of the web server.

### Objectives:
1. Install only `docker` on your server and download [`northwind` database](https://github.com/exzvor/freedevopsworkspace/blob/main/postgres/northwind.sql) at db directory.
2. Create `Dockerfile` for db. Build and run docker database container on 5432 port.
3. Create `Dockerfile` for backend. Build and run docker backend container on 8080 port. 
4. Create `Dockerfile` for react-app. Build and run docker react container on 80 port. 

### Restrictions:
- Dockerfiles are stored in db, backend and react-app directories, please, do not open it until you've solved them yourself! 
- Use one server, run all three containers right on it.
- Do not install locally on server neither `postgres`, nor `golang` nor `react`.
- Firstly, you should create docker network in order for containers communication.
- Don't forget about web server. Hint: you can use `nginx` in react app. Describe it in `Dockerfile` stage 2.
- You can create a bash script to automate containers management and app debugging.
- In this take ignore `docker-compose.yml`.

### What to learn:
- [Overview of best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#:~:text=What%20is%20a%20Dockerfile%3F,can%20find%20at%20Dockerfile%20reference.)