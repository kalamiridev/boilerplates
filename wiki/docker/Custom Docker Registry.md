https://hub.docker.com/_/registry  
https://docs.docker.com/registry  
https://gabrieltanner.org/blog/docker-registry  
https://www.blackvoid.club/private-docker-registry-with-portainer

Docker Compose

[docker-registry/docker-compose.yml](https://github.com/kalamiridev/boilerplates/blob/main/docker-compose/docker-registry/docker-compose.yml)

Registry Commands

```docker
docker pull registry/image:version
```

```docker
docker tag registry/image:version custom-registry-url/image:version
```

```docker
docker push custom-registry-url/image:version
```

```bash
cd /var/lib/docker/volumes/registry_data/_data/docker/registry/v2/repositories
```

ERROR: The push refers to repository [custom-registry-url/image:version]
Get "custom-registry-url/image:version/v2/": http: server gave HTTP response to HTTPS client

SOLUTION:

```bash
sudo nano /etc/docker/daemon.json
```



```json
{ 
    "insecure-registries":
    [
        "custom-registry-url", 
        "custom-registry-url2"
    ] 
}
```
`sudo service docker restart`