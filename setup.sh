#!/bin/bash

function usage() {
cat <<_EOM
    Usage:
      $0

    Description:
      Just run this script without any arguments to create symlinks.

    Options:
      None
_EOM
exit 1
}

function create_link() {
  if [ $# -ne 2 ]; then
      echo "error: only 2 arguments is needed in create_link function"
      exit 1
  fi

  SRC=$1
  DST=$2

  if [ ! -f "${DST}" ]; then
      ln -s ${SRC} ${DST} && echo "link is created: ${DST} -> ${SRC}"
  fi
}

if [ $# -gt 0 ]; then
    usage
fi

create_link ${PWD}/tmux/.tmux.conf  ${HOME}/.tmux.conf
create_link ${PWD}/vim/.vimrc       ${HOME}/.vimrc
create_link ${PWD}/screen/.screenrc ${HOME}/.screenrc
