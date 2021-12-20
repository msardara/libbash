#!/usr/bin/env bash

# Call a function once
function call_once() {
  # OP_NAME is the name of the function
  local OP_NAME=${1}
  # If function was already called return
  [[ -f /tmp/${OP_NAME} ]] && return 0
  # Otherwise call the function
  "${@}"
  # And mark the function as called if no error occurred
  echo "${OP_NAME}" > "/tmp/${OP_NAME}"
}
