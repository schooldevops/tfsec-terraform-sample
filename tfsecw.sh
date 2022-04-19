#!/bin/bash 

echo "---------------------- Check directory"

ls ./

echo "----------------------- Run tfsec with docker"

echo "$(pwd)"

# docker run --rm -v "$(pwd):/src" aquasec/tfsec /src --no-color -f junit > tfsec_result.xml
# docker run --rm -v "$(pwd):/src" aquasec/tfsec /src -f junit > tfsec_results.xml
docker run --rm -v "./:/src" aquasec/tfsec /src --no-color

ls -lat $(pwd)

echo "------------------------------------------------"
cat tfsec_results.xml