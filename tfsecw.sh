#!/bin/bash 

echo "---------------------- Check directory"

ls ./

echo "----------------------- Run tfsec with docker"

echo "$(pwd)"

# docker run --rm -v "$(pwd):/src" aquasec/tfsec /src --no-color -f junit > tfsec_result.xml
# docker run --rm -v "$(pwd):/src" aquasec/tfsec /src -f junit > tfsec_results.xml
# docker run --rm -v $(pwd)/:/src aquasec/tfsec /src --no-color

curl -fsSL https://github.com/aquasecurity/tfsec/releases/download/v1.18.0/tfsec_1.18.0_linux_arm64.tar.gz

tar xzvf tfsec_1.18.0_linux_arm64.tar.gz --directory ./tfsec_dir

ls -alt ./tfsec_dir 

chmod 755 ./tfsec_dir/bin/tfsec

./tfsec_dir . -f junit > tfsec_results.xml

# ls -lat $(pwd)

echo "------------------------------------------------"
cat tfsec_results.xml