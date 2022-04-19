#!/bin/bash 

echo "---------------------- Check tfsec"

# wget https://github.com/aquasecurity/tfsec/releases/download/v1.18.0/tfsec_1.18.0_linux_arm64.tar.gz
# tar zxvf tfsec_1.18.0_linux_arm64.tar.gz

# ls ./

# ./tfsec ./ --no-color

ls ./

echo "----------------------- Run tfsec with docker"

docker run --rm -it -v "$(pwd):/src" aquasec/tfsec /src --no-color