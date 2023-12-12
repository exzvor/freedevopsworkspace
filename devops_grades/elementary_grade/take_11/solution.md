## Run a simple app (part 1)

1. Create docker network
   - `docker network create appnetwork`
2. Write a `Dockerfile` for db, you can specify password right in run command
   Build and run it:
   - `docker build -t db .`
   - `docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=your_password --network=appnetwork db`
3. Write a `Dockerfile` for backend
    - `docker build -t app .`
    - `docker run -d -p 8080:8080 --network=appnetwork app`
4. Write a Dockerfile for react-app, do not forget about `nginx` web server
    - `docker build -t react-app .`
    - `docker run -d -p 80:80 --network=appnetwork react-app`
5. Write nginx configuration for web server. [Here is an example](https://github.com/exzvor/freedevopsworkspace/blob/main/app/react-app/nginx.conf).
6. After running all three containers go to server ip and check web page. There should be depicted products name data.
7. You can create a bash scrip for automate docker build and run. Example in the app directory - `run.sh`.