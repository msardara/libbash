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

color_wrap() {
    echo -en "$(eval "echo \${${1:-}[0]}")" "${@:2}" "$(eval "echo \${${1:-}[1]}")"
}

black() {
    color_wrap black "${@}"
}

red() {
    color_wrap red "${@}"
}

green() {
    color_wrap green "${@}"
}

yellow() {
    color_wrap yellow "${@}"
}

blue() {
    color_wrap blue "${@}"
}

magenta() {
    color_wrap magenta "${@}"
}

cyan() {
    color_wrap cyan "${@}"
}

white() {
    color_wrap white "${@}"
}

grey() {
    color_wrap grey "${@}"
}

bold() {
    color_wrap bold "${@}"
}

italic() {
    color_wrap italic "${@}"
}

underline() {
    color_wrap underline "${@}"
}

inverse() {
    color_wrap inverse "${@}"
}
