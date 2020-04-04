#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install rust for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

rust_package_name=rust
RUST_PLUGIN_DIR="$(dirname "${0}":A)"
RUST_SOURCE_PATH="${RUST_PLUGIN_DIR}"/src

export RUST_MESSAGE_BREW_ERROR="Please Install brew or use antibody bundle luismayta/zsh-brew branch:develop"
export RUST_MESSAGE_NVM_ERROR="Please Install nvm or use antibody bundle luismayta/zsh-nvm branch:develop"


# shellcheck source=/dev/null
source "${RUST_SOURCE_PATH}"/base.zsh


function rust::install {
    message_info "Installing ${rust_package_name}"
    curl https://sh.rustup.rs -sSf | sh
    rust::install::dependences::factory
    message_succcess "Installed ${rust_package_name}"
}

function rust::install::dependences::factory {
    if type async_init > /dev/null; then
        rust::install::dependences::async
        return
    fi
    rust::install::dependences
}

function rust::install::dependences::async {
    if ! type -p rustc > /dev/null; then
        async_init
        # Start a worker that will report job completion
        async_start_worker rust_worker_install -u
        # Register our callback function to run when the job completes
        async_register_callback rust_worker_install rust::completed::callback
        # Start the job
        async_job rust_worker_install rust::install::dependences
    fi
}

function rust::install::dependences {
    message_info "Installing packages required ${rust_package_name}"
    rustup install nightly
    cargo install fselect
    message_success "Installed packages required ${rust_package_name}"
}

# Define a function to process the result of the job
function rust::completed::callback {
    message_succcess "Done"
}

function rust::load {
    # Add RUST to PATH for scripting
    [ -e "${HOME}/.cargo/bin" ] && export PATH="${HOME}/.cargo/bin:${PATH}"
}

rust::load

if ! type -p rustc > /dev/null; then rust::install; fi
