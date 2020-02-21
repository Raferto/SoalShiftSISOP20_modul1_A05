#!/bin/bash


wget -o "/home/raferto/Documents/4. Sisop/Praktikum 1/soal3/Foto/wget.log"  "https://loremflickr.com/320/240/cat" -O "/home/raferto/Documents/4. Sisop/Praktikum 1/soal3/Foto/pdkt_kusuma_1"


for (( i = 2; i < 29; i++ )); do
  wget -a "/home/raferto/Documents/4. Sisop/Praktikum 1/soal3/Foto/wget.log"  "https://loremflickr.com/320/240/cat" -O "/home/raferto/Documents/4. Sisop/Praktikum 1/soal3/Foto/pdkt_kusuma_${i}"
done
