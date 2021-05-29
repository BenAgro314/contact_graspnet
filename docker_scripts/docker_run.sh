#!/bin/bash

echo ""
echo "Running contact_graspnet container"
echo ""

port=2200
name='contact_graspnet'

while getopts p:n: option
do
    case "${option}"
        in
        p) port=${OPTARG};; 
        n) name=${OPTARG};;
    esac
done

echo "Using port: $port"
echo "Using container name: $name"

sudo docker run -it \
    -v /home/agrobenj/contact_graspnet:/home/$USER/workspace \
    -p $port:22 \
    --name $name \
    --gpus all \
    contact_graspnet \
    /bin/bash
