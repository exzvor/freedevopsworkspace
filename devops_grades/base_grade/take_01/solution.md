## Meet Gitlab

1. Configure gitlab-runner with docker
   - `docker volume create gitlab-runner-config`
   - `docker run -d --name gitlab-runner --restart always \
     -v /var/run/docker.sock:/var/run/docker.sock \
     -v gitlab-runner-config:/etc/gitlab-runner \
     gitlab/gitlab-runner:latest`
   - `docker exec -it gitlab-runner gitlab-runner register`
   - enter your Gitlab address and registration token
   - write tag name
   - choose `docker` executor
   - use default docker image `docker:dind`
   - visit Runner page and assure project runner is there
2. Configure Gitlab variables
   - visit variables page
   - choose file option
   - name it `env` and add your values there
3. Change your `docker-compose.yml`. In order to allow your docker compose see Gitlab variables
rewrite this `env_file: .env` to `env_file: $env` everywhere
4. Write .gitlab-ci.yml for your app. [Here is a short example](https://github.com/exzvor/freedevopsworkspace/blob/main/app/.gitlab-ci.yml)
5. Check that pipeline is succeed and visit your app web server.

### Hint
If you met such an error during pipeline that I met: `ERROR: error during connect: Get "http://docker:2375/v1.24/info": dial tcp: lookup docker on 10.129.0.2:53: no such host`

Follow these steps:
   - `docker volume inspect gitlab-runner-config`
   - look at the `"Mountpoint"`
   - visit you docker mount point, for example: `cd /var/lib/docker/volumes/gitlab-runner-config/_data`
   - edit `config.toml` (Runner configuration)
   - your volumes line should be changed like this: `volumes = ["/var/run/docker.sock:/var/run/docker.sock", "/cache"]`
   - save file