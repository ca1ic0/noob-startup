#!/bin/bash
[ ${USER} != root ] && echo "no root" && exit 0 
#install software package
apt update && \
apt install \
golang g++ gcc cmake git make clang clangd python-is-python3 python3-pip python3-venv \
fzf btop timeshift httpie llvm \
docker.io docker-compose \
openssh-server \
-y

#systemcd 
systemctl enable ssh 
systemctl restart ssh 
systemctl enable docker 
systemctl restart docker

#portainer
bash ./docker.sh
docker  && bash ./portainer.sh || "No Docker installed, please check the driver"

# CUDA toolchain
which nvidia-smi && ./cuda.sh || echo  "No nv-smi installed, please check the driver" 
[ -z ${CUDA_HOME} ] && echo " No CUDA INSTALLED On This System! " || ./nv-container.sh   

# tailscale
curl -fsSL https://tailscale.com/install.sh | sh
