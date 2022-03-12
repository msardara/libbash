#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

CONTROL_PATH_DIR="${HOME}/.ssh/controlmasters"

ssh::persistent_connection() {
    mkdir -p ${CONTROL_PATH_DIR}
    ssh -o "ControlMaster=auto" -o "ControlPath=${CONTROL_PATH_DIR}/%r@%h:%p" -o "ControlPersist=10m" "${@}" 2> /dev/null
}
