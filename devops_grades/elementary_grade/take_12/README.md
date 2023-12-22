## Run a simple app (part 2) 
[Here is an example](https://github.com/exzvor/freedevopsworkspace/tree/main/app) of simple app to run. There are database as db, backend in golang and frontend in react. Your task is to 
create `docker-compose.yml` to start a service consisting of three containers (that you ran in the take 11) on port 80 of the web server.

### Objectives:
1. Create `docker-compose.yml` to start a service.

### Restrictions:
- `docker-compose.yml` should be built on the basis of three containers (`db`, `app`, `react-app`)
- Environment should be kept in `.env` file

### What to learn:
- [Try Docker Compose](https://docs.docker.com/compose/gettingstarted/)