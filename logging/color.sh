#!/usr/bin/env bash

declare -a bold=("\033[1m" "\033[22m")
declare -a italic=("\033[3m" "\033[23m")
declare -a underline=("\033[4m" "\033[24m")
declare -a inverse=("\033[7m" "\033[27m")
declare -a white=("\033[37m" "\033[39m")
declare -a grey=("\033[90m" "\033[39m")
declare -a black=("\033[30m" "\033[39m")
declare -a blue=("\033[34m" "\033[39m")
declare -a cyan=("\033[36m" "\033[39m")
declare -a green=("\033[32m" "\033[39m")
declare -a magenta=("\033[35m" "\033[39m")
declare -a red=("\033[31m" "\033[39m")
declare -a yellow=("\033[33m" "\033[39m")

function logging::color::wrap() {
    echo -en "$(eval "echo \${${1:-}[0]}")" "${@:2}" "$(eval "echo \${${1:-}[1]}")"
}

function logging::color::black() {
    logging::color::wrap black "${@}"
}

function logging::color::red() {
    logging::color::wrap red "${@}"
}

function logging::color::green() {
    logging::color::wrap green "${@}"
}

function logging::color::yellow() {
    logging::color::wrap yellow "${@}"
}

function logging::color::blue() {
    logging::color::wrap blue "${@}"
}

function logging::color::magenta() {
    logging::color::wrap magenta "${@}"
}

function logging::color::cyan() {
    logging::color::wrap cyan "${@}"
}

function logging::color::white() {
    logging::color::wrap white "${@}"
}

function logging::color::grey() {
    logging::color::wrap grey "${@}"
}

function logging::color::bold() {
    logging::color::wrap bold "${@}"
}

function logging::color::italic() {
    logging::color::wrap italic "${@}"
}

function logging::color::underline() {
    logging::color::wrap underline "${@}"
}

function logging::color::inverse() {
    logging::color::wrap inverse "${@}"
}
