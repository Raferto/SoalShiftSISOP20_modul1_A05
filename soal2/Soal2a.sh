#!/bin/bash

pass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | grep [[:upper:]] | grep [[:lower:]] | grep [[:digit:]] | head -n 1)

# echo $pass

if [[ ${@:1} =~ [^a-zA-Z] ]]; then
  echo INVALID
else
  echo $pass > "$(pwd)/Password/${@:1}.txt"
fi
