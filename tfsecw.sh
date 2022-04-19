#!/bin/bash 

echo "---------------------- Check directory"

ls ./

echo "----------------------- Run tfsec with docker"

docker run --rm -v "$(pwd):/src" aquasec/tfsec /src --no-color

