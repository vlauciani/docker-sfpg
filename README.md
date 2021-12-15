[![License](https://img.shields.io/github/license/vlauciani/docker-sfpg.svg)](https://github.com/vlauciani/docker-sfpg/blob/main/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/vlauciani/docker-sfpg.svg)](https://github.com/vlauciani/docker-sfpg/issues)

[![Docker build](https://img.shields.io/badge/docker%20build-from%20CI-yellow)](https://hub.docker.com/r/vlauciani/docker-sfpg)
![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/vlauciani/docker-sfpg?sort=semver)
![Docker Pulls](https://img.shields.io/docker/pulls/vlauciani/docker-sfpg)

# docker-sfpg [![Version](https://img.shields.io/badge/dynamic/yaml?label=ver&query=softwareVersion&url=https://raw.githubusercontent.com/vlauciani/docker-sfpg/main/publiccode.yml)](https://github.com/vlauciani/docker-sfpg/blob/main/publiccode.yml) [![CircleCI](https://circleci.com/gh/vlauciani/docker-sfpg/tree/main.svg?style=svg)](https://circleci.com/gh/vlauciani/docker-sfpg/tree/main) | [![GitHub](https://img.shields.io/static/v1?label=GitHub&message=Link%20to%20repository&color=blueviolet)](https://github.com/vlauciani/docker-sfpg)

This Docker is based on "Single File PHP Gallery" by Kenny Svalgaard https://sye.dk/sfpg/ and generate a web gallery.

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
$ docker run -it --user $(id -u):$(id -g) --rm -v $(pwd)/stationxml.conf:/opt/stationxml.conf -v $(pwd)/OUTPUT:/opt/OUTPUT vlauciani/docker-sfpg -h

 This docker search the given STATIONXML_PARAMETERS on StationXML and convert it to RESP or DATALESS files or DATASELECT_LIST list.

  Print software version number:
  $ docker run -it --rm vlauciani/docker-sfpg -v

  Usage:
  $ docker run -it --rm --user $(id -u):$(id -g) -v $(pwd)/stationxml.conf:/opt/stationxml.conf -v $(pwd)/OUTPUT:/opt/OUTPUT vlauciani/docker-sfpg -u <stationxml params>

    Values for option -t: resp, paz, dless, dataselect_list, miniseed, sac

    Examples:
     1) $ docker run -it --rm ingv/docker-sfpg -v
     2) $ docker run -it --rm --user $(id -u):$(id -g) -v $(pwd)/stationxml.conf:/opt/stationxml.conf -v $(pwd)/OUTPUT:/opt/OUTPUT ingv/docker-sfpg -u "network=IV&station=ACER&starttime=2017-11-02T00:00:00&endtime=2017-11-02T01:00:00" -t "dataselect_list"
     3) $ docker run -it --rm --user $(id -u):$(id -g) -v $(pwd)/stationxml.conf:/opt/stationxml.conf -v $(pwd)/OUTPUT:/opt/OUTPUT ingv/fdsnws-fetcher -u "network=IV&latitude=42&longitude=12&maxradius=1" -t "dataselect_list"
     4) $ docker run -it --rm --user $(id -u):$(id -g) -v $(pwd)/stationxml.conf:/opt/stationxml.conf -v $(pwd)/OUTPUT:/opt/OUTPUT ingv/fdsnws-fetcher -u "network=IV&latitude=47.12&longitude=11.38&maxradius=0.5&channel=HH?,EH?,HN?" -t "dataselect_list"
     5) $ docker run -it --rm --user $(id -u):$(id -g) -v $(pwd)/stationxml.conf:/opt/stationxml.conf -v $(pwd)/OUTPUT:/opt/OUTPUT ingv/fdsnws-fetcher -u "network=IV,MN&station=BLY&starttime=2017-11-02T00:00:00&endtime=2017-11-02T01:00:00" -t "dless"
     6) $ docker run -it --rm --user $(id -u):$(id -g) -v $(pwd)/stationxml.conf:/opt/stationxml.conf -v $(pwd)/OUTPUT:/opt/OUTPUT ingv/fdsnws-fetcher -u "lat=45.75&lon=11.1&maxradius=1&starttime=2017-11-02T00:00:00&endtime=2017-11-02T01:00:00" -t "resp,dless"
     7) $ docker run -it --rm --user $(id -u):$(id -g) -v $(pwd)/stationxml.conf:/opt/stationxml.conf -v $(pwd)/OUTPUT:/opt/OUTPUT ingv/fdsnws-fetcher -u "lat=45.75&lon=11.1&maxradius=1&starttime=2017-11-02T00:00:00&endtime=2017-11-02T01:00:00" -t "miniseed,resp"
     8) $ docker run -it --rm --user $(id -u):$(id -g) -v $(pwd)/stationxml.conf:/opt/stationxml.conf -v $(pwd)/OUTPUT:/opt/OUTPUT ingv/fdsnws-fetcher -u "lat=45.75&lon=11.1&maxradius=1&starttime=2017-11-02T00:00:00&endtime=2017-11-02T01:00:00" -t "sac,dataselect_list"

    Example with auth token for restricted stations:
     1) $ docker run -it --rm --user $(id -u):$(id -g) -v $(pwd)/stationxml.conf:/opt/stationxml.conf -v $(pwd)/OUTPUT:/opt/OUTPUT -v $(pwd)/my_token:/opt/token ingv/fdsnws-fetcher -u "network=IV&station=ACER&starttime=2017-11-02T00:00:00&endtime=2017-11-02T01:00:00" -t "dataselect_list"
     2) $ docker run -it --rm --user $(id -u):$(id -g) -v $(pwd)/stationxml.conf:/opt/stationxml.conf -v $(pwd)/OUTPUT:/opt/OUTPUT -v $(pwd)/my_token:/opt/token ingv/fdsnws-fetcher -u "lat=45.75&lon=11.1&maxradius=1&starttime=2017-11-02T00:00:00&endtime=2017-11-02T01:00:00" -t "miniseed,resp"
     3) $ docker run -it --rm --user $(id -u):$(id -g) -v $(pwd)/stationxml.conf:/opt/stationxml.conf -v $(pwd)/OUTPUT:/opt/OUTPUT -v $(pwd)/my_token:/opt/token ingv/fdsnws-fetcher -u "lat=45.75&lon=11.1&maxradius=1&starttime=2017-11-02T00:00:00&endtime=2017-11-02T01:00:00" -t "sac"

$
```

The output data is into the `./OUTPUT` local directory.

### Example screenshot
![alt text](images/screen_output.png)

### Enter into the Docker
To override the `ENTRYPOINT` directive and enter into the Docker images, run:
```
$ docker run -it --user $(id -u):$(id -g) --rm -v $(pwd)/OUTPUT:/opt/OUTPUT -v $(pwd)/stationxml.conf:/opt/stationxml.conf --entrypoint=bash ingv/fdsnws-fetcher
```
or with `root`:
```
$ docker run -it --rm -v $(pwd)/OUTPUT:/opt/OUTPUT -v $(pwd)/stationxml.conf:/opt/stationxml.conf --entrypoint=bash ingv/fdsnws-fetcher
```

## Update Docker image from DockerHub
Get last Docker image from DockerHub repository:
```
$ docker pull ingv/fdsnws-fetcher
```

## Update `stationxml.conf`
Update your `stationxml.conf` adding more StationXML entry point.

From version `v2.30.0`, the file `stationxml.conf` was update to support three columns:
- fdsn *station* node. **mandatory**
- additional `GET` paramas for *station* node
- different *dataselect* node to submit waveforms request. Default is equal to *station* node

the syntax is:
```
<stationxml_node>|<additional_GET_params>|<dataselect_node>
```

for example:
```
http://webservices.ingv.it|authoritative=any|http://eidaws-internal.int.ingv.it:8080
http://service.iris.edu
http://rtserve.beg.utexas.edu
http://seisrequest.iag.usp.br
```

the line `http://webservices.ingv.it|authoritative=any|http://eidaws-internal.int.ingv.it:8080` will be used to:
- request stations info from `http://webservices.ingv.it` adding `authoritative=any` to the request (`http://webservices.ingv.it/fdsnws/station/1/query?authoritative=any&<other_params>`
- request the waveforms to the *dataselect* node: `http://eidaws-internal.int.ingv.it/fdsnws/dataselect/1/query?<params>`

# Contribute
Thanks to your contributions!

Here is a list of users who already contributed to this repository:
<a href="https://github.com/ingv/fdsnws-fetcher/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=ingv/fdsnws-fetcher" />
</a>

# Author
(c) 2019 Valentino Lauciani valentino.lauciani[at]ingv.it

Istituto Nazionale di Geofisica e Vulcanologia, Italia
