#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install rust for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

LIGHT_GREEN='\033[1;32m'
CLEAR='\033[0m'

function rust::install {
    echo -e "${CLEAR}${LIGHT_GREEN}Installing RUST${CLEAR}"
    curl https://sh.rustup.rs -sSf | sh
    rust::custom
}

function rust::custom {
    if (( $+commands[rustc] )); then
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
    echo -e "${CLEAR}${LIGHT_GREEN}Installing required packages${CLEAR}"
    rustup install nightly
    cargo install fselect
    zstyle ':notify:*' success-title "Finished install dependences"
}

# Define a function to process the result of the job
function rust::completed::callback {
    async_job rust_worker_install rust::install::dependences
}

function rust::init {
    # Add RUST to PATH for scripting
    [[ -e "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"
}

rust::init

if (( ! $+commands[rustc] )); then
    rust::install
fi
