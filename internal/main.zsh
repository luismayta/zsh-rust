#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function rust::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_RUST_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_RUST_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_RUST_PATH}"/internal/linux.zsh
      ;;
    esac
}

rust::internal::main::factory

if ! type -p curl > /dev/null; then core::install curl; fi
if ! type -p rustc > /dev/null; then rust::internal::rust::install; fi
