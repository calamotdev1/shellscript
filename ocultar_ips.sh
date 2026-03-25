#!/bin/bash

# Script to anonymize IP addresses by replacing the last octet with X
if [ $# -eq 0 ]; then
    # Read from stdin
    sed 's/\.[0-9]\+$/.X/'
else
    # Read from file
    sed 's/\.[0-9]\+$/.X/' "$1"
fi