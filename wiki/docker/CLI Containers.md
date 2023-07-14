
### PORTAINER

`docker volume create portainer_data`

 - portainer ce

`docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce`

- portainer ee

`docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ee:latest`

### WATCHTOWER
`docker run -d \
--name watchtower \
-e WATCHTOWER_CLEANUP=true \
-e WATCHTOWER_INCLUDE_STOPPED=true \
-e WATCHTOWER_INCLUDE_RESTARTING=true \
-e WATCHTOWER_ROLLING_RESTART=true \
-v /var/run/docker.sock:/var/run/docker.sock \
--restart=always \
containrrr/watchtower`

### BITWARDEN
`docker run -d --name=bitwarden \
-p 3012:3012 \
-p 5151:80 \
-e SIGNUPS_ALLOWED=true \
-e SIGNUPS_VERIFY=false \
-e DOMAIN=https://your.domain.com \
-e SMTP_HOST=smtp.gmail.com \
-e SMTP_FROM=your@mail.com \
-e SMTP_PORT=587 \
-e SMTP_SECURITY=starttls \
-e SMTP_USERNAME=your@mail.com \
-e SMTP_PASSWORD=app_password \
-v bitwarden_data:/data \
--restart always \
vaultwarden/server`