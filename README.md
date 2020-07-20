<img src="https://raw.githubusercontent.com/elbb/bb-buildingblock/master/.assets/logo.png" height="200">

# Local development environment

The following section describes the supported environments in detail.

## Local concourse CI environment

This environment contains a concourse CI server, a docker registry and a MinIO server that canbe used for local development.

The environment can be started using dobi.

```sh
./dobi.sh dev-environment-concourse-start
```

The environment can also be stopped using dobi.

```sh
./dobi.sh dev-environment-concourse-stop
```

When the environment is started, docker volumes for concourse database, MinIO and docker registry are created and used by these services. This has the advantage, that the history is kept after a restart of the concourse environment.

To set a concourse environment to the default state, this can also be done with dobi.

```sh
./dobi.sh dev-environment-concourse-clean
```

### concourse CI server

#### General

This environment has a local instance of a concourse CI server.

#### Usage

The  concourse CI server can be reached via your local browser.

- Address: localhost
- Port: 8080
- User Name: test
- User PW: test

#### Example

[http://localhost:8080](http://localhost:8080)

### MinIO server

#### General

Minio is an object storage server that contains the same public API as Amazon S3. This means that applications that can interact with Amazon S3, can be configured to interact with Minio in this local environment.

The following docker image is used:
- minio/minio:RELEASE.2020-05-16T01-33-21Z

#### Usage

- Address: localhost
- Port: 9000
- MinIO Access Key: localaccess
- Minio Secret Key: localsecret

[http://localhost:9000](http://localhost:9000)

#### Example

A good starting point to work with the MinIO server, please read the offical documentation.
<https://github.com/minio/minio#explore-further>

### docker registry

#### General

If you create your own docker images, you may also need a registry to manage them. The local registry is intended for the development phase, before the generated images are published on services like Docker Hub.

The following docker image is used:
- registry:2

#### Usage

- Address: localhost
- Port: 5000

#### Example

A small example explains the sequence.

First we get an official image of the "bash" from Docker Hub.

```sh
docker pull bash:latest
```

Then we generate a Test-Tag and push it to our local server.

```sh
docker tag bash:latest localhost:5000/test_bash
docker push localhost:5000/test_bash
```

To check if the created image is available in the local registry, the registry-cleanup tool can be used.

Notes on operation:

```sh
docker run --rm -it elbb/registry-cleanup -help
```

Access to the local docker registry using :

```sh
DOCKER_HOST_IP=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')
docker run --rm -it elbb/registry-cleanup -address http://${DOCKER_HOST_IP}:5000
```

## Local (Conan) Artifactory Community Edition for C/C++

If you want to use or deploy your own conan packages in your concourse pipeline you need a reachable "Artifactory Community Edition for C/C++". This Toolset contains a preprovisioned one with default credentials. Don't use it for production purposes!
You can start the local "Artifactory Community Edition for C/C++" via
```sh
dobi.sh dev-environment-artifactory-cpp-ce-start
```
It can be stopped via
```sh
dobi.sh dev-environment-artifactory-cpp-ce-stop
```
You can reset the "Artifactory ce for C/C++" environment to the default state via

```sh
./dobi.sh dev-environment-artifactory-cpp-ce-clean
```

### Usage

- Address: localhost
- Ports: 8081 (REST API), 8082 (UI + all other product APIs)
- User Name: admin
- User PW: password

### Usage from concourse environment

"Artifactory CE for C/C++" is reachable within a concourse pipeline via name "artifactory-cpp-ce" with the default ports 8081/8082.

## Configuration/Adaption of your dev environment

If you have local port conflicts when using the concourse or artifactory environment, you can adapt these.
Simply copy `env/local.env.template` to `env/local.env` and adapt `env/local.env` to your needs.
Furthermore you can configure the used docker network and version of dependencies like concourse etc..

# License

Licensed under either of

* Apache License, Version 2.0, (./LICENSE-APACHE or <http://www.apache.org/licenses/LICENSE-2.0>)
* MIT license (./LICENSE-MIT or <http://opensource.org/licenses/MIT>)

at your option.

# Contribution

Unless you explicitly state otherwise, any contribution intentionally
submitted for inclusion in the work by you, as defined in the Apache-2.0
license, shall be dual licensed as above, without any additional terms or
conditions.

Copyright (c) 2020 conplement AG
