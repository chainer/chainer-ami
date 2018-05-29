# Chainer AMI
- Amazon Machine Image which pre-installed all the Chainer families (`Chainer`, `CuPy`, `ChainerMN`, `ChainerCV`, `ChainerRL`) and CUDA aware OpenMPI
  - CUDA aware OpenMPI was built only for `cuda-9.0`.
  - all the chainer families are built and installed against both `python` and `python3`.
  - see [chainer-ami.json](chainer-ami.json) for versions
- This image is based on [Deep Leraning Base AMI (Ubuntu)](https://aws.amazon.com/marketplace/pp/B077GCZ4GR).

## Latest Released AMIs: version 0.1.0

Please also refer to [Cloudformation template](https://github.com/chainer/chainer-cfn) for building ChainerMN cluster on EC2.

| region | AMI ID |
----|----
|ap-northeast-1 | ami-ca08f0b5 |
|ap-northeast-2 | ami-d2bb10bc |
|ap-south-1 | ami-5daf8032 |
|ap-southeast-1 | ami-98b689e4 |
|ap-southeast-2 | ami-df9042bd |
|ca-central-1 | ami-37e16253 |
|eu-central-1 | ami-24685dcf |
|eu-west-1 | ami-c3b48fba |
|eu-west-2 | ami-370ce050 |
|eu-west-3 | ami-c95beab4 |
|sa-east-1 | ami-a1fea0cd |
|us-east-1 | ami-ea7f1095 |
|us-east-2 | ami-dd7946b8 |
|us-west-1 | ami-2dbba04d |
|us-west-2 | ami-ea403b92 |

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

# Release Notes
## Version 0.1.0
### Base Image
[Deep Leraning Base AMI (Ubuntu)](https://aws.amazon.com/marketplace/pp/B077GCZ4GR) version `4.0`

### Library Versions
  - Chainer `4.1.0`, CuPy `4.1.0`
  - ChainerMN `1.3.0`,
  - ChainerRL `0.3.0`
  - ChainerCV `0.9.0`
  - CUDA aware OpenMPI `2.1.3`

### Published AMI
| region | AMI ID |
----|----
|ap-northeast-1 | ami-ca08f0b5 |
|ap-northeast-2 | ami-d2bb10bc |
|ap-south-1 | ami-5daf8032 |
|ap-southeast-1 | ami-98b689e4 |
|ap-southeast-2 | ami-df9042bd |
|ca-central-1 | ami-37e16253 |
|eu-central-1 | ami-24685dcf |
|eu-west-1 | ami-c3b48fba |
|eu-west-2 | ami-370ce050 |
|eu-west-3 | ami-c95beab4 |
|sa-east-1 | ami-a1fea0cd |
|us-east-1 | ami-ea7f1095 |
|us-east-2 | ami-dd7946b8 |
|us-west-1 | ami-2dbba04d |
|us-west-2 | ami-ea403b92 |
