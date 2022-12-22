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
