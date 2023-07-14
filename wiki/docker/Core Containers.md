
## Portainer
Add Volume

```docker
docker volume create portainer_data
```
 Install Portainer ce
```docker
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```
Install Portainer ee

```docker
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ee:latest
```
## Watchtower

Install Watchtower

```docker
docker run -d --name watchtower -e WATCHTOWER_CLEANUP=true -e WATCHTOWER_INCLUDE_STOPPED=true -e WATCHTOWER_INCLUDE_RESTARTING=true -e WATCHTOWER_ROLLING_RESTART=true -v /var/run/docker.sock:/var/run/docker.sock --restart=always containrrr/watchtower
```