#!/usr/bin/env bash

# Import logging library
source "logging/log.sh"

# Try to log something
function do_log() {
    info "Hello"
    warning "This"
    error "is"
    debug "the"
    error "log"
    warning "testing"
    info "!!!!!!"
}

# Set log level
log_level INFO
do_log
log_level DEBUG
do_log
log_level ERROR
do_log
log_level WARN
do_log