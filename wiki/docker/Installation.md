## Install Docker Engine

`apt-get update`

- install packages to allow apt to use a repository over HTTPS

`apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release`

- add Dockers official GPG key

`mkdir -p /etc/apt/keyrings`

`curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg`

`chmod a+r /etc/apt/keyrings/docker.gpg`

- use the following command to set up the repository

`echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null`
  
- install Docker Engine

`apt-get update`

`apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin`

## Uninstall Docker Engine

`apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin`

-  delete all images, containers, and volumes

`rm -rf /var/lib/docker`

`rm -rf /var/lib/containerd`