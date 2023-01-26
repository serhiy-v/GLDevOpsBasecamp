#!/bin/bash

if curl $IP_ADDRESS | grep "Jenkins" > /dev/null
then 
    echo "Test passed"
else
    echo "Test Failed"
    exit 1
fi