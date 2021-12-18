#!/usr/bin/env bash

function wait_for_pattern_in_file() {
    local file=${1}
    local pattern=${2}

    ( tail -f -n0 "${file}" & ) | grep -E -q "${pattern}"
}
