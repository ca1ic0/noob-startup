#!/bin/bash
echo -n "输入docker加速器地址:"
read P_DOCKER_MIRROR_ADDR
[ -z $P_DOCKER_MIRROR_ADDR ] && echo "Input mirror is empty" && exit 0 ,
echo -n "Mirror is ${P_DOCKER_MIRROR_ADDR}"
sudo mkdir -p /etc/docker
cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "registry-mirrors": ["$P_DOCKER_MIRROR_ADDR"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
