#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function rust::dependences {
    message_info "Installing dependences for ${RUST_PACKAGE_NAME}"
    if ! type -p curl > /dev/null; then rust::internal::curl::install; fi
    message_success "Installed dependences for ${RUST_PACKAGE_NAME}"
}

function rust::install {
    rust::internal::rust::install
}

function rust::load {
    rust::internal::rust::load
}

function rust::post_install {
    message_info "Post Install ${RUST_PACKAGE_NAME}"
    message_success "Success Install ${RUST_PACKAGE_NAME}"
}

function rust::upgrade {
    rust::internal::rust::upgrade
}

function rust::package::all::install {
    rust::internal::packages::install
}

function rust::install::versions {
    rust::internal::version::all::install
}

function rust::install::version::global {
    rust::internal::version::global::install
}
