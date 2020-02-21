#!/bin/bash

en=${1:: -4}
t=$(date -r Password/$1 "+%H")

if [[ $t -eq 1 ]]; then
  en=($(echo ${en[@]} | tr a-z b-za))
elif [[ $t -eq 2 ]]; then
  en=($(echo ${en[@]} | tr a-z c-zab))
elif [[ $t -eq 3 ]]; then
  en=($(echo ${en[@]} | tr a-z d-za-c))
elif [[ $t -eq 4 ]]; then
  en=($(echo ${en[@]} | tr a-z e-za-d))
elif [[ $t -eq 5 ]]; then
  en=($(echo ${en[@]} | tr a-z f-za-e))
elif [[ $t -eq 6 ]]; then
  en=($(echo ${en[@]} | tr a-z g-za-f))
elif [[ $t -eq 7 ]]; then
  en=($(echo ${en[@]} | tr a-z h-za-g))
elif [[ $t -eq 8 ]]; then
  en=($(echo ${en[@]} | tr a-z i-za-h))
elif [[ $t -eq 9 ]]; then
  en=($(echo ${en[@]} | tr a-z j-za-i))
elif [[ $t -eq 10 ]]; then
  en=($(echo ${en[@]} | tr a-z k-za-j))
elif [[ $t -eq 11 ]]; then
  en=($(echo ${en[@]} | tr a-z l-za-k))
elif [[ $t -eq 12 ]]; then
  en=($(echo ${en[@]} | tr a-z m-za-l))
elif [[ $t -eq 13 ]]; then
  en=($(echo ${en[@]} | tr a-z n-za-m))
elif [[ $t -eq 14 ]]; then
  en=($(echo ${en[@]} | tr a-z o-za-n))
elif [[ $t -eq 15 ]]; then
  en=($(echo ${en[@]} | tr a-z p-za-o))
elif [[ $t -eq 16 ]]; then
  en=($(echo ${en[@]} | tr a-z q-za-p))
elif [[ $t -eq 17 ]]; then
  en=($(echo ${en[@]} | tr a-z r-za-q))
elif [[ $t -eq 18 ]]; then
  en=($(echo ${en[@]} | tr a-z s-za-r))
elif [[ $t -eq 19 ]]; then
  en=($(echo ${en[@]} | tr a-z t-za-s))
elif [[ $t -eq 20 ]]; then
  en=($(echo ${en[@]} | tr a-z u-za-t))
elif [[ $t -eq 21 ]]; then
  en=($(echo ${en[@]} | tr a-z v-za-u))
elif [[ $t -eq 22 ]]; then
  en=($(echo ${en[@]} | tr a-z w-za-v))
elif [[ $t -eq 23 ]]; then
  en=($(echo ${en[@]} | tr a-z x-za-w))
fi

mv "/home/raferto/Documents/4. Sisop/Praktikum 1/soal2/Password/$1" "/home/raferto/Documents/4. Sisop/Praktikum 1/soal2/Password/$en.txt"
