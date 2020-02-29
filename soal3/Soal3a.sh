#!/bin/bash


wget -o "$(pwd)/Foto/wget.log"  "https://loremflickr.com/320/240/cat" -O "$(pwd)/Foto/pdkt_kusuma_1"


for (( i = 2; i < 29; i++ )); do
  wget -a "$(pwd)/Foto/wget.log"  "https://loremflickr.com/320/240/cat" -O "$(pwd)/Foto/pdkt_kusuma_${i}"
done
