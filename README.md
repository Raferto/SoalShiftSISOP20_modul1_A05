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
Kita diminta untuk membuat password random yang terdiri dari 28 karakter, terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argument yang diinputkan dan hanya berupa alphabet. Kemudian nama filenya akan dienkripsi dengan konversi huruf yang disesuaikan dengan jam dibuatnya file tersebut. Lalu dibuat dekripsinya supaya nama file bisa kembali.

```bash
#!/bin/bash
pass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)
# echo $pass ${@:1}

if [[ ${@:1} =~ [^a-zA-Z] ]]; then
  echo INVALID
else
  echo $pass > "/home/raferto/Documents/4. Sisop/Praktikum 1/Password/${@:1}.txt"
fi
```
Penjelasan:
```bash
pass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)
# echo $pass ${@:1}
```
Digunakan untuk generate password random sebanyak 28 karakter terdiri dari huruf kecil, huruf besar, dan angka
```bash
if [[ ${@:1} =~ [^a-zA-Z] ]]; then
  echo INVALID
```
Digunakan untuk mengecek apakah input argumen hanya terdiri dari alphabet
```bash
echo $pass > "/home/raferto/Documents/4. Sisop/Praktikum 1/Password/${@:1}.txt"
```
Jika input argumen benar, maka file .txt dibuat
## Soal 3
Kita diminta membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat " menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" serta menyimpan log message wget ke file “wget.log”.
script tersebut hanya berjalan 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu.
Kemudian membuat script untuk mengidentifikasi gambar yang identik dari keseluruhan
gambar yang terdownload. Bila terindikasi sebagai gambar yang identik, maka
disisakan 1 gambar dan sisa file identik tersebut dipindahkan ke dalam folder ./duplicate
dengan format filename "duplicate_nomor". Lalu semua gambar yang tersisa dipindahkan ke folder ./kenangan dengan format filename "kenangan_nomor". Setelah tidak ada gambar di current directory, dilakukan backup seluruh log menjadi
ekstensi ".log.bak".
