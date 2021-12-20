#!/usr/bin/env bash

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
