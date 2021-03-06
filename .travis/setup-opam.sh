#!/bin/bash
set -uexv

. .travis/common.sh

wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh -O - | sudo sh -s /usr/local/bin $OCAMLVER
/usr/local/bin/opam init --auto-setup --compiler=$OCAMLVER
eval `opam config env`
# Workaround for ocaml-windows32
mkdir -p "$(opam config var lib)/graphics"

opam update
