# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.4.0] 2020.Q4

- added `default.env`, `local.env.template` and doku how to use it -> enables setting default and local environment variables for `dobi` targets
- `dobi.sh` downloads `dobi` if `dobi` is not `$PATH`
- `dobi.sh`: parameter checking and handling for `dobi` target `list` and `dobi.sh` target `version`
- added email notification on error in `concourse` pipeline
- version bump of concourse to 6.6.0

## [0.3.2] 2020.Q3

- enable setting concourse ui URL
- version bump of concourse to 6.5.1

## [0.3.1] 2020.Q3

- version bump of codechecker to 6.13.0

## [0.3.0] 2020.Q3

- added codechecker web server

## [0.2.0] 2020.Q3

- added "Artifactory Community Edition for C/C++"
- ports are now configurable via env/local.env
- versions of dependencies are now configurable via env/local.env
- the used docker network is now configurable via env/local.env

## [0.1.0] - 2020-06-02

Initial Version

### Added

- added concourse CI environment
