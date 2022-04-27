#!/bin/bash 

cd elasticache

echo "checking variable for [$1]"

resultDir="../$1/results/"

for entry in "$1"/*
do
    # echo $entry
    entryAr=`echo ${entry} | cut -d '.' -f 1`

    # echo ${entryAr}
    fileAr=`echo ${entryAr} | cut -d '/' -f 2`
    mkdir -p ${resultDir}

    tfsec . --tfvars-file $entry -f json > ${entryAr}".json"
    mv ${entryAr}".json" ${resultDir}${fileAr}".json"
    # echo "-----------------------------------------------"
done


