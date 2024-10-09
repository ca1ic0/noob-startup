#!/bin/bash
sudo apt install docker.io docker-compose -y
sudo systemctl daemon-reload
sudo systemctl restart docker
