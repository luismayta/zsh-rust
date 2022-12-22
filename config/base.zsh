#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

export RUST_CARGO_BIN="${HOME}/.cargo/bin"
export RUST_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew"
export RUST_PACKAGE_NAME=rust
export RUST_CARGO_PACKAGES=(
    fselect
    nu --features=dataframe
)
export RUST_RUSTUP_PACKAGES=(
    nightly
)
