#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function rust::internal::rust::install {
    message_info "Installing ${RUST_PACKAGE_NAME}"
    curl https://sh.rustup.rs -sSf | sh
    message_success "Installed ${RUST_PACKAGE_NAME}"
}

function rust::internal::rust::init {
    message_warning "not implement function rust::internal::rust::init"
}

function rust::internal::rust::load {
    [ -e "${RUST_CARGO_BIN}" ] && export PATH="${RUST_CARGO_BIN}:${PATH}"
}

function rust::internal::curl::install {
    message_info "Installing curl for ${RUST_PACKAGE_NAME}"
    if ! type -p brew > /dev/null; then
        message_warning "${RUST_MESSAGE_BREW}"
    fi
    brew install curl
    message_success "Installed curl for ${RUST_PACKAGE_NAME}"
}

function rust::internal::packages::install {
    message_warning "not implement function rust::internal::packages::install"
}

function rust::internal::version::all::install {
    message_warning "not implement function rust::internal::version::all::install"
}

function rust::internal::version::global::install {
    message_warning "not implement function rust::internal::version::global::install"
}

function rust::internal::rust::upgrade {
    message_warning "not implement function rust::internal::rust::upgrade"
}