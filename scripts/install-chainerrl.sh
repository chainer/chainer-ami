#! /bin/bash

install_for() {
  python_cmd=$1

  # to make sure to use pip bound to given python version, we should use 'python_cmd -m pip'
  # ref: https://docs.aws.amazon.com/dlami/latest/devguide/BASE_AML1.html#BASE_AML1-known-issues
  $python_cmd -m pip --no-cache-dir install chainerrl==$CHAINER_RL_VERSION

  # TODO TEST
}

install_for python2
install_for python3
