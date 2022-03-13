#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "${SCRIPT_DIR}/../logging/log.sh"

function synchronization::files::wait_until_file_exist() {
    local file=${1}
    until [ -f "${file}" ]; do
        sleep 1
    done
}

function synchronization::files::wait_for_pattern_in_file() {
    local file=${1}
    local pattern=${2}

    (tail -f -n0 "${file}" &) | grep -E -q "${pattern}"
}

function synchronization::process::wait_until_suceed() {
  while ! "${@}" &>/dev/null; do
    logging::log::warning "Command ${*} failed with error code ${?}"
    sleep 2
  done
}

