#!/usr/bin/env bash

function process::run() {
  "${@}"
}

function process::run::as_root() {
   process::run sudo "${@}"
}

