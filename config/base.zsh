#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

export RUST_CARGO_BIN="${HOME}/.cargo/bin"
export RUST_CARGO_ENV="${HOME}/.cargo/env"
export RUST_PACKAGE_NAME=rust
export RUST_CARGO_PACKAGES=(
  bat
  fselect
  ripgrep
  du-dust
  bottom
  zellij
  typos-cli
  committed
  zoxide --locked
  nu --features=dataframe
  btop
  create-tauri-app --locked
  eza
  git-delta
)

export RUST_RUSTUP_PACKAGES=(
  nightly
)