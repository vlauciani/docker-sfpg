[![License](https://img.shields.io/github/license/vlauciani/docker-sfpg?label=License)](https://github.com/vlauciani/docker-sfpg/blob/main/LICENSE)

[![DockerHub](https://img.shields.io/badge/DockerHub-link_to_repository-blueviolet?style=flat&logo=docker&logoColor=blue&logoSize=auto)](https://hub.docker.com/r/vlauciani/docker-sfpg)
![DockerHub Image Size](https://img.shields.io/docker/image-size/vlauciani/docker-sfpg?sort=semver&style=flat&logo=docker&logoSize=auto&label=DockerHub%20Image%20Size)
![DockerHub Pulls](https://img.shields.io/docker/pulls/vlauciani/docker-sfpg?style=flat&logo=docker&logoSize=auto&label=DockerHub%20Image%20Pull)

[![GitHub Static Badge](https://img.shields.io/badge/GitHub-link_to_repository-blueviolet?style=flat&logo=github&logoSize=auto)](https://github.com/vlauciani/docker-sfpg)
[![GitHub Issues](https://img.shields.io/github/issues/vlauciani/docker-sfpg?label=GitHub%20Issues&logo=github)](https://github.com/vlauciani/docker-sfpg/issues)

![Dynamic YAML Badge](https://img.shields.io/badge/dynamic/yaml?url=https%3A%2F%2Fraw.githubusercontent.com%2FINGV%2Fpyml%2Fmain%2F.github%2Fworkflows%2Fdocker-image.yml&query=%24..platforms&style=flat&logo=amazonec2&logoColor=white&logoSize=auto&label=Supported%20Arch)

# docker-sfpg  [![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/vlauciani/docker-sfpg/docker-image.yml?branch=main&style=flat&logo=GitHub-Actions&logoColor=white&logoSize=auto&label=GitHub%20Actions)](https://github.com/vlauciani/docker-sfpg/actions)

This Docker is based on "Single File PHP Gallery" by Kenny Svalgaard:
- https://sye.dk/sfpg/ 

## Quickstart
### Clone the repository
First, clone the git repositry:
```
$ git clone https://github.com/vlauciani/docker-sfpg.git
$ cd docker-sfpg
```

### Docker image
To obtain *docker-sfpg* docker image, you have two options:

#### 1) Get built image from DockerHub (*preferred*)
Get the last built image from DockerHub repository:
```
$ docker pull vlauciani/docker-sfpg:latest
```

#### 2) Build by yourself
```
$ docker build --tag vlauciani/docker-sfpg . 
```

in case of errors, try:
```
$ docker build --no-cache --pull --tag vlauciani/docker-sfpg . 
```

### Run docker
Running the command below to see the **help**:
```
$ docker run -p 8080:80 -v /home/myPictures:/var/www/html/images vlauciani/docker-sfpg
```

### Test
Check installation with test url:
- http://<your_ip>:8080/sfpg_test.php

## Update Docker image from DockerHub
Get last Docker image from DockerHub repository:
```
$ docker pull vlauciani/docker-sfpg
```

# Contribute
Thanks to your contributions!

Here is a list of users who already contributed to this repository: \
<a href="https://github.com/vlauciani/docker-sfpg/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=vlauciani/docker-sfpg" />
</a>

# Credits
- Tobiaqs: https://github.com/Tobiaqs/sfpg-docker
 
# Author
(c) 2024 Valentino Lauciani vlauciani[at]gmail.com

