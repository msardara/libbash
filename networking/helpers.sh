#!/usr/bin/env bash

function networking::helpers::get_interface_address() {
  local IFACE=${1}
  ip -4 addr show "${IFACE}" | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
}

function networking::helpers::get_main_interface() {
  run:: ip route get 8.8.8.8 | awk '{print $5}'
}

function networking::helpers::get_default_interface_address() {
  local IFACE=$(get-main-interface)
  get-interface-address "${IFACE}"
}

