#!/bin/bash



exec > >(tee /var/log/backend-setup.log | logger -t user-data -s 2>/dev/console) 2>&1

set -e


yum update -y


amazon-linux-extras enable docker

yum install -y docker


systemctl enable docker

systemctl start docker

usermod -aG docker ec2-user

mkdir -p /usr/local/lib/docker/cli-plugins

curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose

chmod +x /usr/local/lib/docker/cli-plugins/docker-compose


docker --version
docker compose version
