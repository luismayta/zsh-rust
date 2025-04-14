#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function rust::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_RUST_PATH}"/internal/base.zsh
    # shellcheck source=/dev/null
    source "${ZSH_RUST_PATH}"/internal/packages.zsh

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

rust::internal::rust::load

if ! core::exists curl; then core::install curl; fi
if ! core::exists rustc; then rust::internal::rust::install; fi
if ! core::exists delta; then rust::internal::delta::load; fi