#!/bin/bash

declare -a arr

awk -f Soal3c1.awk '/home/raferto/Documents/4. Sisop/Praktikum 1/soal3/Foto/wget.log'
while IFS= read -r line
do
  arr+=(${line:: -1});
done < "/home/raferto/Documents/4. Sisop/Praktikum 1/soal3/Foto/Location.log"


ken=$(awk '{print $1}' '/home/raferto/Documents/4. Sisop/Praktikum 1/soal3/Foto/numbering.log')
dup=$(awk '{print $2}' '/home/raferto/Documents/4. Sisop/Praktikum 1/soal3/Foto/numbering.log')

uniq=($(printf "%s\n" "${arr[@]}" | sort -u | tr '\n' ' '))
len=${#uniq[@]}-28;
len2=${#arr[@]};

for (( i = 0; i < $len; i++ )); do
  for (( j = 0; j < $len2; j=$j+2 )); do
    if [[ ${arr[j]} == ${uniq[i]} ]]; then
      let ken=$ken+1
      mv "/home/raferto/Documents/4. Sisop/Praktikum 1/soal3/Foto/${arr[j+1]}" "/home/raferto/Documents/4. Sisop/Praktikum 1/soal3/Foto/kenangan/kenangan_$ken"

      for(( j=$j+2 ; j< $len2; j=$j+2 )); do
        if [[ ${arr[j]} == ${uniq[i]} ]]; then
          let dup=$dup+1
          mv "/home/raferto/Documents/4. Sisop/Praktikum 1/soal3/Foto/${arr[j+1]}" "/home/raferto/Documents/4. Sisop/Praktikum 1/soal3/Foto/duplicate/duplicate_$dup"
        fi
      done
    fi
  done
done

echo $ken $dup > "/home/raferto/Documents/4. Sisop/Praktikum 1/soal3/Foto/numbering.log"
while IFS= read -r line
do
  echo $line >> "/home/raferto/Documents/4. Sisop/Praktikum 1/soal3/Foto/wget.log.bak"
done < "/home/raferto/Documents/4. Sisop/Praktikum 1/soal3/Foto/wget.log"
