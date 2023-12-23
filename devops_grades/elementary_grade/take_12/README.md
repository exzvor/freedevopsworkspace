## Run a simple app (part 2) 
To complete this [app](https://github.com/exzvor/freedevopsworkspace/tree/main/app), you will 
need to create a `docker-compose.yml` file that defines 
a service comprising three containers: one for the database (named db), one for the 
Golang backend, and one for the React frontend. These containers should be configured 
to run on port 80 of the web server.

### Objectives:
1. Create `docker-compose.yml` to start a service.

### Restrictions:
- `docker-compose.yml` should be built on the basis of three containers (`db`, `app`, `react-app`)
- Environment should be kept in `.env` file

### What to learn:
- [Try Docker Compose](https://docs.docker.com/compose/gettingstarted/)