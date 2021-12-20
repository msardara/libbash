#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "${SCRIPT_DIR}/../containers/map.sh"
source "${SCRIPT_DIR}/../logging/color.sh"

declare -A levels=([DEBUG]=0 [INFO]=1 [WARN]=2 [ERROR]=3)
declare -A colors=([DEBUG]=blue [INFO]=green [WARN]=yellow [ERROR]=red)
logging_level="INFO"

function logging::log::log_level() {
    local level=${1}

    # check if level exists
    if ! containers::map::contains_key "levels" "${level}"; then
        return 1
    fi

    logging_level=${level}
}

function logging::log::warning() {
    logging::log "WARN" "${@}"
}

function logging::log::error() {
    logging::log "ERROR" "${@}"
}

function logging::log::info() {
    logging::log "INFO" "${@}"
}

function logging::log::debug() {
    logging::log "DEBUG" "${@}"
}

function logging::log() {
    local log_priority=${1}
    local log_message=${2}

    # check if level exists
    if ! containers::map::contains_key levels "${log_priority}"; then
        return 1
    fi

    # check if level is enough
    ((${levels[${log_priority}]} < ${levels[${logging_level}]})) && return 2

    # log here
    local color=${colors[${log_priority}]}
    printf "%-33s" "$("logging::color::${color}" "$("logging::color::bold" "[${log_priority}]:")")"
    printf '%s\n' "$("logging::color::${color}" "${log_message}")"
}
