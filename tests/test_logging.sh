#!/usr/bin/env bash

# Import logging library
source "logging/log.sh"

# Try to log something
function do_log() {
    logging::log::info "Hello"
    logging::log::warning "This"
    logging::log::error "is"
    logging::log::debug "the"
    logging::log::error "log"
    logging::log::warning "testing"
    logging::log::info "!!!!!!"
}

# Set log level
logging::log::log_level INFO
do_log
logging::log::log_level DEBUG
do_log
logging::log::log_level ERROR
do_log
logging::log::log_level WARN
do_log