#!/bin/bash

pass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)
# echo $pass ${@:1}

if [[ ${@:1} =~ [^a-zA-Z] ]]; then
  echo INVALID
else
  echo $pass > "/home/raferto/Documents/4. Sisop/Praktikum 1/soal2/Password/${@:1}.txt"
fi
