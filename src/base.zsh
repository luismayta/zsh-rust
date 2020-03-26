#!/usr/bin/env ksh
# -*- coding: utf-8 -*-


function curl::install {
    message_info "Installing curl"
    if ! type -p brew > /dev/null; then
        message_warning  "${RUST_MESSAGE_BREW_ERROR}"
        return
    fi
    brew install curl
    message_success "Installed curl"
}

if ! type -p curl > /dev/null; then
    curl::install
fi
