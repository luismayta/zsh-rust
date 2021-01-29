#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function rust::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_RUST_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_RUST_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_RUST_PATH}"/config/linux.zsh
      ;;
    esac
}

rust::config::main::factory