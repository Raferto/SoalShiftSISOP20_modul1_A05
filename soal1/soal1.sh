
echo -e "\n1a"
echo -e "Region dengan profit paling sedikit:"
region=$(awk -F "\t" 'FNR == 1 {next} {arr[$13]+=$21} END {for(i in arr) {print arr[i],i}}' no1.tsv | sort -gk1 | awk '{print $2}' | head -1)
echo "$region"

echo -e "\n1b"
echo -e "State dengan profit paling sedikit:"
state=$(awk -F  "\t" -v region=$region '($13~region) {arr[$11]+=$21} END {for(i in arr) print arr[i],i}' no1.tsv | sort -gk1 | head -2 | awk '{print $2}')
echo "$state"

echo -e "\n1c"
echo -e "Produk dengan profit paling sedikit:"
st1=$(echo $state | sed -ne '1p')
st2=$(echo $state | sed -ne '2p')
produk=$(awk -F  "\t" -v st1="$st1" -v st2="$st2" '($11~st1) || ($11~st2) {arr[$17]+=$21} END {for(i in arr) print arr[i],i}' no1.tsv | sort -gk1 | head -10 | awk '{for(i=2;i<NF;i++) printf "%s", $i OFS; printf "%s", $NF ORS}')
echo -e "$produk\n"
