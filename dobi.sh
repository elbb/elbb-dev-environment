#!/bin/bash

set -o errexit   # abort on nonzero exitstatus
set -o pipefail  # don't hide errors within pipes

dobi --filename meta.yaml version # generate actual version files

# check argument count
if [ -z ${1} ]; then
    echo "no arguments!"
    dobi --filename meta.yaml list
    exit 1
fi

# load and export concourse environment env file
set -o allexport
source env/global.env
source env/local.env
set +o allexport

set +o errexit
docker network create ${NETWORK:-elbb-dev} &>/dev/null
set -o errexit

# execute dobi with meta as default
exec dobi --filename meta.yaml ${@}
