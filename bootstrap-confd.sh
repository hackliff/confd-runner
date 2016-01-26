#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

install_requirements() {
  apk update
  apk add openssl
}

install_confd() {
  local confd_version=${1:-"0.11.0"}
  # TODO auto-detection
  local platform="linux-amd64"
  local confd_dest=${2:-"/usr/local/bin"}
  local github_url="https://github.com/kelseyhightower/confd/releases/download"
  wget \
    -O ${confd_dest}/confd \
    ${github_url}/v${confd_version}/confd-${confd_version}-${platform}
  chmod +x ${confd_dest}/confd
  mkdir -p /etc/confd/{conf.d,templates}
}

# TODO adapt package manager (only needed on alpine AFAIK)
#install_requirements
install_confd $@
