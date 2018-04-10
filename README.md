# Chainer AMI
- Amazon Machine Image which pre-installed all the Chainer families (`Chainer`, `CuPy`, `ChainerMN`, `ChainerCV`, `ChainerRL`) and CUDA aware OpenMPI
  - CUDA aware OpenMPI was built only for `cuda-9.0`.
  - all the chainer families are built and installed against both `python` and `python3`.
  - see [chainer-ami.json](chainer-ami.json) for versions
- This image is based on [Deep Leraning Base AMI (Ubuntu)](https://aws.amazon.com/marketplace/pp/B077GCZ4GR).

## Library Versions
see [chainer-ami.json](chainer-ami.json)

## Development Manual
### How to build by yourself
#### requirements
- [packer](https://www.packer.io/docs/builders/amazon-ebs.html#ami_description)
- [AWS Command Line Interface](https://aws.amazon.com/cli/)

```
# configure  AWS client properly first.
# you can configure regions to build and publish in chainer-ami.json

./build-ami.sh [packer build options]
```

### How to release

```
# configure AWS client properly.

./build-ami.sh --var-file release_params.json
```
