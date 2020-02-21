# -SoalShiftSISOP20_modul1_A05-

## Soal 1
Kita diminta untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”.Laporan yang diminta berupa:
<br>a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit
<br>b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a
<br>c. Tampilkan 10 product name yang memiliki profit paling sedikit berdasarkan 2 state hasil poin b

**Jawaban**

```bash
echo -e "\n1a"
echo -e "Region dengan profit paling sedikit:"
awk -F "\t" 'FNR == 1 {next} {arr[$13]+=$21} 
END {for(i in arr) {print arr[i],i}}' ~/no1.tsv | sort -gk1 | awk '(NR<=1) {print $2}'

echo -e "\n1b"
echo -e "State dengan profit paling sedikit:"
awk -F  "\t" 'FNR == 1 {next}{if($13 == "Central") arr[$11]+=$21} 
END {for(i in arr) print arr[i],i}' ~/no1.tsv | sort -gk1 | awk '(NR<=2) {print $2}'

echo -e "\n1c"
echo -e "Produk dengan profit paling sedikit di Texas:"
awk -F  "\t" 'FNR == 1 {next}{if($11 == "Texas") arr[$17]+=$21} 
END {for(i in arr) print arr[i],i}' ~/no1.tsv | sort -gk1 | awk '(NR<=10) {print $2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12}'

echo -e "\nProduk dengan profit paling sedikit di Illiois:"
awk -F  "\t" 'FNR == 1 {next}{if($11 == "Illinois") arr[$17]+=$21} 
END {for(i in arr) print arr[i],i}' ~/no1.tsv | sort -gk1 | awk '(NR<=10) {print $2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12}'
```
Penjelasan:
```bash
echo -e "\n1a"
echo -e "Region dengan profit paling sedikit:"
awk -F "\t" 'FNR == 1 {next} {arr[$13]+=$21} 
END {for(i in arr) {print arr[i],i}}' ~/no1.tsv | sort -gk1 | awk '(NR<=1) {print $2}'
```
-F digunakan untuk memisahkan kolom, karena pada data pemisahnya adalah tab, maka digunakan “\t”. FNR == 1 {next} digunakan untuk meng-exclude baris pertama. Kolom data yang berisi region dan profit dimasukkan ke array. Array dengan key arg ke-13 diisi sum arg ke-21 (profit). Print array ke-i dan i. Lalu dilakukan sorting secara ascending pada profit dan diambil 1 baris teratas kemudian print region nya.
```bash
echo -e "\n1b"
echo -e "State dengan profit paling sedikit:"
awk -F  "\t" 'FNR == 1 {next}{if($13 == "Central") arr[$11]+=$21} 
END {for(i in arr) print arr[i],i}' ~/no1.tsv | sort -gk1 | awk '(NR<=2) {print $2}'
```
-F digunakan untuk memisahkan kolom, karena pada data pemisahnya adalah tab, maka digunakan “\t”. FNR == 1 {next} digunakan untuk meng-exclude baris pertama. Jika kolom ke-13 berisi “Central” (jawaban dari no 1.a), array dengan key arg ke-11 diisi sum arg ke-21 (profit). Print array ke-i dan i. Lalu dilakukan sorting secara ascending pada profit dan diambil 2 baris teratas kemudian print state nya.
```bash
echo -e "\n1c"
echo -e "Produk dengan profit paling sedikit di Texas:"
awk -F  "\t" 'FNR == 1 {next}{if($11 == "Texas") arr[$17]+=$21} 
END {for(i in arr) print arr[i],i}' ~/no1.tsv | sort -gk1 | awk '(NR<=10) {print $2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12}'
```
-F digunakan untuk memisahkan kolom, karena pada data pemisahnya adalah tab, maka digunakan “\t”. FNR == 1 {next} digunakan untuk meng-exclude baris pertama. Jika kolom ke-11 berisi “Texas” (jawaban dari no 1.b), array dengan key arg ke-17 diisi sum arg ke-21 (profit). Print array ke-i dan i. Lalu dilakukan sorting secara ascending pada profit dan diambil 10 baris teratas kemudian print nama produknya. Nama produk terpanjang memiliki 11 kata, maka yang di print adalah arg ke-2 sampai arg ke-12.
```bash
echo -e "\nProduk dengan profit paling sedikit di Illiois:"
awk -F  "\t" 'FNR == 1 {next}{if($11 == "Illinois") arr[$17]+=$21} 
END {for(i in arr) print arr[i],i}' ~/no1.tsv | sort -gk1 | awk '(NR<=10) {print $2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12}'
```
-F digunakan untuk memisahkan kolom, karena pada data pemisahnya adalah tab, maka digunakan “\t”. FNR == 1 {next} digunakan untuk meng-exclude baris pertama. Jika kolom ke-11 berisi “Illinois” (jawaban dari no 1.b), array dengan key arg ke-17 diisi sum arg ke-21 (profit). Print array ke-i dan i. Lalu dilakukan sorting secara ascending pada profit dan diambil 10 baris teratas kemudian print nama produknya. Nama produk terpanjang memiliki 11 kata, maka yang di print adalah arg ke-2 sampai arg ke-12.
## Soal 2
