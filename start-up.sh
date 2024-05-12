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
#bash ./docker.sh
#docker > /dev/null && bash ./portainer.sh

# CUDA toolchain
which nvidia-smi && ./cuda.sh || echo  "No nv-smi installed, please check the driver" 
[ -e ${CUDA_HOME} ] && ./nv-container.sh  || echo " No CUDA INSTALLED On This System! "


