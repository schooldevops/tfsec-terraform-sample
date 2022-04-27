#!/bin/bash 

echo "---------------------- Check directory"

ls ./

echo "----------------------- Run tfsec with docker"

echo "$(pwd)"

# docker run --rm -v "$(pwd):/src" aquasec/tfsec /src --no-color -f junit > tfsec_result.xml
# docker run --rm -v "$(pwd):/src" aquasec/tfsec /src -f junit > tfsec_results.xml
# docker run --rm -v $(pwd)/:/src aquasec/tfsec /src --no-color

curl -fsSLO https://github.com/aquasecurity/tfsec/releases/download/v1.18.0/tfsec_1.18.0_linux_arm64.tar.gz

mkdir "$(pwd)/tfsec_dir"

tar xzvf tfsec_1.18.0_linux_arm64.tar.gz -C "$(pwd)/tfsec_dir"

# ls -alt "$(pwd)/tfsec_dir"

# $(pwd)/tfsec_dir/tfsec . -f junit > tfsec_results.xml

# echo "------------------------------------------------"
# cat tfsec_results.xml