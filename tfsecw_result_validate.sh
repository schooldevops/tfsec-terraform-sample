#!/bin/bash 

echo "Install JQ"

sudo apt-get update && sudo apt-get install jq

echo "checking tfsec results for [$1]"

resultDir="$1/results"

echo $resultDir

if [ -d $resultDir ]
then
    for entry in "${resultDir}"/*
    do
        if [ -f $entry ]; then
            echo $entry
            check_result=`jq '.results | length > 0' $entry`
            if [ "$check_result" = false ] ; then 
                rm $entry
            fi
        fi
    done

    for entry in "${resultDir}"/*
    do
        if [ -f $entry ]
        then
            echo $entry
            check_result=`jq '.results | length > 0' $entry`
            if [ "$check_result" = true ] ; then 
                echo 'Error exists in results'
                exit 3
            fi
        else 
            echo 'Checking file not found in '$entry
        fi
    done
else 
    echo 'Directory [$resultDir] is not Exists'
    exit 1
fi
