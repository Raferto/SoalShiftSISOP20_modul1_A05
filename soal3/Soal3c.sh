#!/bin/bash

ken=$(awk '{print $1}' "$(pwd)/Foto/num.txt")
dup=$(awk '{print $2}' "$(pwd)/Foto/num.txt")

arr=$(awk -v x="$(pwd)" ' BEGIN { FS = "[/ || ]" }
      /.jpg/ {
        print $5
        getline;getline;getline;getline;getline;
        print $14
      }' "$(pwd)/Foto/wget.log")

declare -a array
for item in $arr; do
  array+=(${item::-1})
done

len=${#array[@]}
for (( i = 1; i < $len; i+=2 )); do
  if [ -e "$(pwd)/Foto/${array[i]}" ]; then
    mv "$(pwd)/Foto/${array[i]}" "$(pwd)/Foto/kenangan/kenangan_$ken"
    let ken=$ken+1
    for (( j = i+1; j < $len; j+=2 )); do
      if [[ ${array[j]} == ${array[i-1]} ]]; then
        mv "$(pwd)/Foto/${array[j+1]}" "$(pwd)/Foto/duplicate/duplicate_$dup"
        let dup=$dup+1
      fi
    done
 fi
done

echo $ken $dup > "$(pwd)/Foto/num.txt"
while IFS= read -r line
do
  echo $line >> "$(pwd)/Foto/wget.log.bak"
done < "$(pwd)/Foto/wget.log"
