[![License](https://img.shields.io/github/license/vlauciani/docker-sfpg.svg)](https://github.com/vlauciani/docker-sfpg/blob/main/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/vlauciani/docker-sfpg.svg)](https://github.com/vlauciani/docker-sfpg/issues)

[![Docker build](https://img.shields.io/badge/docker%20build-from%20CI-yellow)](https://hub.docker.com/r/vlauciani/docker-sfpg)
![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/vlauciani/docker-sfpg?sort=semver)
![Docker Pulls](https://img.shields.io/docker/pulls/vlauciani/docker-sfpg)

# docker-sfpg [![Version](https://img.shields.io/badge/dynamic/yaml?label=ver&query=softwareVersion&url=https://raw.githubusercontent.com/vlauciani/docker-sfpg/main/publiccode.yml)](https://github.com/vlauciani/docker-sfpg/blob/main/publiccode.yml) [![CircleCI](https://circleci.com/gh/vlauciani/docker-sfpg/tree/main.svg?style=svg)](https://circleci.com/gh/vlauciani/docker-sfpg/tree/main) | [![GitHub](https://img.shields.io/static/v1?label=GitHub&message=Link%20to%20repository&color=blueviolet)](https://github.com/vlauciani/docker-sfpg)

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

## Update Docker image from DockerHub
Get last Docker image from DockerHub repository:
```
$ docker pull vlauciani/docker-sfpg
```

# Contribute
Thanks to your contributions!

Here is a list of users who already contributed to this repository:
<a href="https://github.com/vlauciani/docker-sfpg/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=vlauciani/docker-sfpg" />
</a>

# Credits
- Tobiaqs: https://github.com/Tobiaqs/sfpg-docker
 
# Author
(c) 2021 Valentino Lauciani vlauciani[at]gmail.com

