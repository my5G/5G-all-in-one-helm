#!/bin/bash

usage="$(basename "$0") [-h] [-r] -- script to build image free5gc-n3iwf

where:
    -h  show this help text
    -r  set repotag | default zanattabruno:latest"

repotag=zanattabruno/free5gc-n3iwf

if [ "$*" == "" ]; then
    echo "No flag is passed using default repotag $repotag"
fi

while getopts :hr: flag
do
    case "${flag}" in
        r) repotag=${OPTARG};;
        h) echo "$usage"
        exit 0;;
    esac
done

docker build . -t $repotag && docker push $repotag