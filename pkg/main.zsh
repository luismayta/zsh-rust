#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function rust::pkg::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_RUST_PATH}"/pkg/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_RUST_PATH}"/pkg/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_RUST_PATH}"/pkg/linux.zsh
      ;;
    esac
    # shellcheck source=/dev/null
    source "${ZSH_RUST_PATH}"/pkg/helper.zsh

    # shellcheck source=/dev/null
    source "${ZSH_RUST_PATH}"/pkg/alias.zsh
}

rust::pkg::main::factory

rust::load
