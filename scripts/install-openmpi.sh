#! /bin/bash
set -e

d=$(pwd)
tmp_dir=$(mktemp -d)
cd $tmp_dir

wget -q https://www.open-mpi.org/software/ompi/v$(echo $OPENMPI_VERSION | sed -e s'/\(.*\)\.[0-9]/\1/')/downloads/openmpi-$OPENMPI_VERSION.tar.bz2
tar -xjf openmpi-$OPENMPI_VERSION.tar.bz2

# this script will find cuda at /usr/local/cuda
# at default in DeepLearning Base AMI,
# /usr/local/cuda links to /usr/local/cuda-9.0
cd openmpi-$OPENMPI_VERSION
./configure --prefix=$OPENMPI_PREFIX --with-cuda
make -j2
make install

# check if openmpi was built with cuda support
$OPENMPI_PREFIX/bin/ompi_info --parsable --all | grep -q "mpi_built_with_cuda_support:value:true"

cd $d
rm -rf $tmp_dir

# system-wide mca params
echo 'btl_base_warn_component_unused = 0' >> $OPENMPI_PREFIX/etc/openmpi-mca-params.conf
echo 'btl_tcp_sndbuf = 0' >> $OPENMPI_PREFIX/etc/openmpi-mca-params.conf
echo 'btl_tcp_rcvbuf = 0' >> $OPENMPI_PREFIX/etc/openmpi-mca-params.conf
echo 'plm_rsh_no_tree_spawn = 1' >> $OPENMPI_PREFIX/etc/openmpi-mca-params.conf
echo 'orte_keep_fqdn_hostnames = t' >> $OPENMPI_PREFIX/etc/openmpi-mca-params.conf
