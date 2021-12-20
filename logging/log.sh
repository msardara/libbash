#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "${SCRIPT_DIR}/../containers/map.sh"
source "${SCRIPT_DIR}/../logging/color.sh"

declare -A levels=([DEBUG]=0 [INFO]=1 [WARN]=2 [ERROR]=3)
declare -A colors=([DEBUG]=blue [INFO]=green [WARN]=yellow [ERROR]=red)
logging_level="INFO"

function log_level() {
    local level=${1}

    # check if level exists
    if ! map_contains_key "levels" "${level}"; then
        return 1
    fi

    logging_level=${level}
}

function warning() {
    log "WARN" "${@}"
}

function error() {
    log "ERROR" "${@}"
}

function info() {
    log "INFO" "${@}"
}

function debug() {
    log "DEBUG" "${@}"
}

function log() {
    local log_priority=${1}
    local log_message=${2}

    # check if level exists
    if ! map_contains_key levels "${log_priority}"; then
        return 1
    fi

    # check if level is enough
    ((${levels[${log_priority}]} < ${levels[${logging_level}]})) && return 2

    # log here
    local color=${colors[${log_priority}]}
    printf "%-33s" "$(${color} "$(bold "[${log_priority}]:")")"
    printf '%s\n' "$(${color} "${log_message}")"
}
