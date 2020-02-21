#!/bin/bash

en=${1:: -4}
t=$(date -r Password/$1 "+%H")

if [[ $t -eq 1 ]]; then
  en=($(echo ${en[@]} | tr b-za a-z))
elif [[ $t -eq 2 ]]; then
  en=($(echo ${en[@]} | tr c-zab a-z))
elif [[ $t -eq 3 ]]; then
  en=($(echo ${en[@]} | tr d-za-c a-z))
elif [[ $t -eq 4 ]]; then
  en=($(echo ${en[@]} | tr e-za-d a-z))
elif [[ $t -eq 5 ]]; then
  en=($(echo ${en[@]} | tr f-za-e a-z))
elif [[ $t -eq 6 ]]; then
  en=($(echo ${en[@]} | tr g-za-f a-z))
elif [[ $t -eq 7 ]]; then
  en=($(echo ${en[@]} | tr h-za-g a-z))
elif [[ $t -eq 8 ]]; then
  en=($(echo ${en[@]} | tr i-za-h a-z))
elif [[ $t -eq 9 ]]; then
  en=($(echo ${en[@]} | tr j-za-i a-z))
elif [[ $t -eq 10 ]]; then
  en=($(echo ${en[@]} | tr k-za-j a-z))
elif [[ $t -eq 11 ]]; then
  en=($(echo ${en[@]} | tr l-za-k a-z))
elif [[ $t -eq 12 ]]; then
  en=($(echo ${en[@]} | tr m-za-l a-z))
elif [[ $t -eq 13 ]]; then
  en=($(echo ${en[@]} | tr n-za-m a-z))
elif [[ $t -eq 14 ]]; then
  en=($(echo ${en[@]} | tr o-za-n a-z))
elif [[ $t -eq 15 ]]; then
  en=($(echo ${en[@]} | tr p-za-o a-z))
elif [[ $t -eq 16 ]]; then
  en=($(echo ${en[@]} | tr q-za-p a-z))
elif [[ $t -eq 17 ]]; then
  en=($(echo ${en[@]} | tr r-za-q a-z))
elif [[ $t -eq 18 ]]; then
  en=($(echo ${en[@]} | tr s-za-r a-z))
elif [[ $t -eq 19 ]]; then
  en=($(echo ${en[@]} | tr t-za-s a-z))
elif [[ $t -eq 20 ]]; then
  en=($(echo ${en[@]} | tr u-za-t a-z))
elif [[ $t -eq 21 ]]; then
  en=($(echo ${en[@]} | tr v-za-u a-z))
elif [[ $t -eq 22 ]]; then
  en=($(echo ${en[@]} | tr w-za-v a-z))
elif [[ $t -eq 23 ]]; then
  en=($(echo ${en[@]} | tr x-za-w a-z))
fi

echo $en.txt
