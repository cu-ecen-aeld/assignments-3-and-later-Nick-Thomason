#!/bin/bash

if [[ $# -ne 2 ]]; then
        echo "Two arguments are required"
        exit 1
elif [[ ! -d $1 ]]; then
        echo "$1 is not a directory or it doesn't exist"
        exit 1
else
	echo "The number of files are $(grep -Rl "$1" -e "$2" | wc -l) and the number of matching lines are $(grep -R "$1" -e "$2" | wc -l)"
fi
