#!/usr/bin/env bash

function strings::split() {
    local string=${1}
    local separator=${2}
    local -n ret_ref=${3}

    IFS=${separator} read -ra ret_ref <<< "${string}"
}
