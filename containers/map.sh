#!/usr/bin/env bash

##############################################
# Check if key is in map.
#
# $1 Map
# $2 Key to find
#
# Example:
#  declare -A themap(["a"]="1" ["b"]="2")
#  if map_contains_element "themap" "a"; then
#    ...
##############################################
function map_contains_key() {
    local -n map_ref=${1}
    local key=${2}

    [[ "${!map_ref[*]}" =~ ${key} ]] && return 0 || return 1
}
