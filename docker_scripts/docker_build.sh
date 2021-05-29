#!/bin/bash

echo ""
echo "Building image contact_graspnet"
echo "root password: $1"
echo "user: $USER"
echo "id: $UID"
echo ""

sudo docker image build --build-arg password=$1 --build-arg user=$USER --build-arg id=$UID -t contact_graspnet .
