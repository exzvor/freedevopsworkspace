## Run first app

1. Download Nginx from Docker Hub:
   - `docker pull nginx`
2. Build a web page to serve on Nginx:
   - `mkdir -p ~/docker-nginx/html`
   - `cd ~/docker-nginx/html`
   - `nano index.html`
   [Here is an example of `index.html` page](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_07/index.html)
3. Give access rights to the file:
   - `sudo chmod 755 index.html`
4. Link the container to the local filesystem and run it:
   - `docker run --name docker-nginx -p 80:80 -d -v ~/docker-nginx/html:/usr/share/nginx/html nginx`
5. Stop the container:
   - `docker stop docker-nginx`
6. Create a file with the `.service` extension (for example, `docker-nginx.service`) in the directory `/etc/systemd/system/`:
   - `sudo nano /etc/systemd/system/docker-nginx.service`
   [Here is an example of `docker-nginx.service`](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_07/docker-nginx.service)
7. Reload `systemd` and enable auto-start:
   - `sudo systemctl daemon-reload` 
   - `sudo systemctl enable docker-nginx.service`
8. Start the service:
   - `sudo systemctl start docker-nginx.service`
9. Reboot system to check if your container is running on localhost.

