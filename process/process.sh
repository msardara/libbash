#!/usr/bin/env bash

function process::run() {
  "${@}"
}

function process::run::nooutput() {
   process::run "${@}" &> /dev/null
}

function process::run::nostdout() {
   process::run "${@}" 1> /dev/null
}

function process::run::nostderr() {
   process::run "${@}" 2> /dev/null
}

function process::run::as_root() {
   process::run sudo "${@}"
}

function process::kill_by_name() {
  local name=${1}

  for pid in $(ps -ef | grep "${name}" | awk '{print $2}') ; do
    process::run::as_root kill "${pid}"
  done
}