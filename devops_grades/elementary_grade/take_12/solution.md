## Run a simple app (part 2)

1. Create `docker-compose.yml` in `/app` repository. [Here is an example](https://github.com/exzvor/freedevopsworkspace/blob/main/app/docker-compose.yml)
2. Create .env file with sensitive postgres data (`POSTGRES_DB`, `POSTGRES_USER`, `POSTGRES_PASSWORD`).
3. Run app with command: `docker compose-up` or `docker-compose up --build`