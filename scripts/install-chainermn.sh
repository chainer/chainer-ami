#! /bin/bash
set -eu

install_for(){
  python_cmd=$1

  # to make sure to use pip bound to given python version, we should use 'python_cmd -m pip'
  # ref: https://docs.aws.amazon.com/dlami/latest/devguide/BASE_AML1.html#BASE_AML1-known-issues
  MPICC=$OPENMPI_PREFIX/bin/mpicc $python_cmd -m pip --no-cache-dir install chainermn==$CHAINER_MN_VERSION

  # check installation
  d=$(pwd)
  tmp_dir=$(mktemp -d)
  cd $tmp_dir

  wget https://raw.githubusercontent.com/chainer/chainermn/v$CHAINER_MN_VERSION/examples/mnist/train_mnist.py

  mkdir -p dataset
  LD_LIBRARY_PATH=/usr/local/cuda/lib64 \
  CHAINER_DATASET_ROOT=$tmp_dir/dataset \
  $OPENMPI_PREFIX/bin/mpiexec -n 1 --allow-run-as-root \
  $python_cmd $tmp_dir/train_mnist.py --batchsize 1000 --epoch 2 --gpu

  cd $d
  rm -rf $tmp_dir
}

install_for python2
install_for python3
