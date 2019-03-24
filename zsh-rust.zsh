#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install zsh for osx or linux.
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
        echo -e "${CLEAR}${LIGHT_GREEN}Installing required packages${CLEAR}"
        rustup install nightly
    fi
}

function rust::init {
    # Add RUST to PATH for scripting
    [[ -e "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"
}

rust::init

if (( ! $+commands[rustc] )); then
    rust::install
fi
