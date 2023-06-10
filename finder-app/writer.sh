#!/bin/bash

file_directory=$1
dir="${file_directory%/*}/"
file="${file_directory##*/}"

if [[ -e $1 ]]; then
  echo $2 > $1

elif [[ -d $dir ]]; then
  echo $2 > "${dir}${file}"

elif [[ ! -d $dir ]]; then
  mkdir -p "$dir"
  echo $2 > "${dir}${file}"

else
  echo "file could not be created"
fi
