#! /bin/bash
set -eu -o pipefail

CUDA_VERSION=$(readlink /usr/local/cuda | xargs basename | cut -f 2 -d'-')
CUPY_PKG=cupy-cuda${CUDA_VERSION/./}

install_for(){
  python_cmd=$1

  d=$(pwd)

  # to make sure to use pip bound to given python version, we should use 'python_cmd -m pip'
  # ref: https://docs.aws.amazon.com/dlami/latest/devguide/BASE_AML1.html#BASE_AML1-known-issues
  $python_cmd -m pip --no-cache-dir install $CUPY_PKG==$CUPY_VERSION chainer==$CHAINER_VERSION

  # check installation
  tmp_dir=$(mktemp -d)
  cd $tmp_dir
  wget -q https://raw.githubusercontent.com/chainer/chainer/v$CHAINER_VERSION/examples/mnist/train_mnist.py

  mkdir -p dataset
  LD_LIBRARY_PATH=/usr/local/cuda/lib64 CHAINER_DATASET_ROOT=$tmp_dir/dataset $python_cmd $tmp_dir/train_mnist.py --epoch 2 --batchsize 1000 --gpu 0 --noplot

  cd $d
  rm -rf $tmp_dir
}

install_for python2
install_for python3
