#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install rust for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

package_name=rust

plugin_dir=$(dirname "${0}":A)

# shellcheck source=/dev/null
source "${plugin_dir}"/src/helpers/messages.zsh
# shellcheck source=/dev/null
source "${plugin_dir}"/src/helpers/tools.zsh

function rust::install {
    message_info "Installing ${package_name}"
    curl https://sh.rustup.rs -sSf | sh
    rust::custom
    message_succcess "Installed ${package_name}"
}

function rust::custom {
    if ! type -p rustc > /dev/null; then
        async_init
        # Start a worker that will report job completion
        async_start_worker rust_worker_install -n
        # Register our callback function to run when the job completes
        async_register_callback rust_worker_install rust::completed::callback
        # Start the job
        async_job rust_worker_install rust::install::dependences
    fi
}

function rust::install::dependences {
    message_info "Installing packages required ${package_name}"
    rustup install nightly
    cargo install fselect
    message_success "Installed packages required ${package_name}"
}

# Define a function to process the result of the job
function rust::completed::callback {
    async_job rust_worker_install rust::install::dependences
}

function rust::init {
    # Add RUST to PATH for scripting
    path::prepend "${HOME}/.cargo/bin"
}

rust::init

if ! type -p rustc > /dev/null; then rust::install; fi
