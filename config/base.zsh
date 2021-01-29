#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

export RUST_CARGO_BIN="${HOME}/.cargo/bin"
export RUST_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"
export RUST_MESSAGE_NVM_ERROR="Please Install nvm or use antibody bundle luismayta/zsh-nvm branch:develop"
export RUST_PACKAGE_NAME=rust
export RUST_CARGO_PACKAGES=(
    fselect
)
export RUST_RUSTUP_PACKAGES=(
    nightly
)
