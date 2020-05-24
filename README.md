<img src="https://raw.githubusercontent.com/elbb/bb-buildingblock/master/.assets/logo.png" height="200">

# Local development environment

The next section describes the supported environments in detail.

## Local Concourse environment

In this development toolset, there is a local Concourse environment that can be used for development purposes.
This environment contains a Concourse Server, a Git Server, a Docker Registry and a MinIO Server.

The environment can be started using dobi.

```sh
./dobi.sh dev-environment-concourse-start  # start the concourse environment
```

The environment can also be stopped using dobi.

```sh
./dobi.sh dev-environment-concourse-stop  # stop the concourse environment
```

When the environment is started, a local folder for the Git-Server and "named volumes" for Concourse-DB, MinIO and Docker-Registry are created and used by these services. This has the advantage, that the history is kept after a restart of the concourse environment.

To set a concourse environment to the default state, this can also be done with dobi.

```sh
./dobi.sh dev-environment-concourse-clean  # clean the concourse environment
```

### Concourse-Server

#### General

This environment has a local instance of a Concourse-Server.
We are using the following docker image:
- https://hub.docker.com/r/concourse/concourse

#### Usage

The Concourse server can be reached via your local browser.

- Address: localhost
- Port: 8080
- User Name: test
- User PW: test

#### Example

http://localhost:8080/

### Git-Server

#### General

The git server manages its repositories in the projects folder "env/concourse/git-repositories".

We are using the following docker image:
- https://hub.docker.com/r/cirocosta/gitserver-http

#### Usage

- Address: localhost
- Port: 8081

#### Example

The following small example should explain how it works:

initialize a bare repository:

```sh
cd env/concourse/git-repositories
git init --bare myrepo.git
```

and then, just clone it somewhere else:

```sh
cd /tmp
git clone http://localhost:8081/myrepo.git
cd myrepo
```

### MinIO-Server

#### General

A good starting point to work with the MinIO-Server, please read the offical documentation.
https://github.com/minio/minio#explore-further

We are using the following docker image:
- https://hub.docker.com/r/minio/minio

#### Usage

- Address: localhost
- Port: 9000
- MinIO Access Key: localaccess
- Minio Secret Key: localsecret

#### Example

 - tbd.

### Docker-Registry

#### General

We are using the following docker image:
- https://hub.docker.com/_/registry

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
