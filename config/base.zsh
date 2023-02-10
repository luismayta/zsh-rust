#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

export RUST_CARGO_BIN="${HOME}/.cargo/bin"
export RUST_PACKAGE_NAME=rust
export RUST_CARGO_PACKAGES=(
  bat
  fselect
  ripgrep
  du-dust
  bottom
  exa
  nu --features=dataframe
)
export RUST_RUSTUP_PACKAGES=(
  nightly
)
