
echo -e "\n1a"

awk -F "\t" 'FNR == 1 {next} {arr[$13]+=$21} END {for(i in arr) {print arr[i],i}}' ~/no1.tsv | sort -gk1 | awk '(NR<=1) {print "Region dengan profit paling sedikit:",$2}'
echo -e "\n1b"
echo -e "State dengan profit paling sedikit:"
awk -F  "\t" 'FNR == 1 {next}{if($13 == "Central") arr[$11]+=$21} END {for(i in arr) print arr[i],i}' ~/no1.tsv | sort -gk1 | awk '(NR<=2) {print $2}'
echo -e "\n1c"
echo -e "Produk dengan profit paling sedikit di Texas:"
awk -F  "\t" 'FNR == 1 {next}{
if($11 == "Texas") arr[$17]+=$21} END {for(i in arr) print arr[i],i}' ~/no1.tsv | sort -gk1 | awk '(NR<=10) {print $2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12}'
echo -e "\nProduk dengan profit paling sedikit di Illiois:"
awk -F  "\t" 'FNR == 1 {next}{
if($11 == "Illinois") arr[$17]+=$21} END {for(i in arr) print arr[i],i}' ~/no1.tsv | sort -gk1 | awk '(NR<=10) {print $2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12}'
