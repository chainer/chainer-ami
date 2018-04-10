#! /bin/bash

sed -i -e '/PermitUserEnvironment/d' /etc/ssh/sshd_config
cat << EOT >> /etc/ssh/sshd_config
PermitUserEnvironment yes
EOT
