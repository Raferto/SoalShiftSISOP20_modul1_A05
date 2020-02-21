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
Kita diminta untuk membuat password random yang terdiri dari 28 karakter, terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argument yang diinputkan dan hanya berupa alphabet. Kemudian nama filenya akan dienkripsi dengan konversi huruf yang disesuaikan dengan jam dibuatnya file tersebut. Lalu dibuat dekripsinya supaya nama file bisa kembali.<br>

**Jawaban**

```bash
#!/bin/bash
pass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)
# echo $pass ${@:1}

if [[ ${@:1} =~ [^a-zA-Z] ]]; then
  echo INVALID
else
  echo $pass > "/home/raferto/Documents/4. Sisop/Praktikum 1/Soal 2/Password/${@:1}.txt"
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
echo $pass > "/home/raferto/Documents/4. Sisop/Praktikum 1/Soal 2/Password/${@:1}.txt"
```
Jika input argumen benar, maka file .txt dibuat<br><br>
**Enkripsi**
```bash
#!/bin/bash

en=${1:: -4}
t=$(date +\%H)

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

mv "/home/raferto/Documents/4. Sisop/Praktikum 1/Soal 2/Password/$1" "/home/raferto/Documents/4. Sisop/Praktikum 1/Soal 2/Password/$en.txt"
```
Penjelasan:
```bash
en=${1:: -4}
t=$(date +\%H)
```
Digunakan untuk mengambil waktu
```bash
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
```
Digunakan untuk melakukan konversi huruf pada nama file<br><br>
**Dekripsi**
```bash
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
```
Penjelasan:
```bash
en=${1:: -4}
t=$(date -r Password/$1 "+%H")
```
Digunakan untuk mengambl waktu last modified dari file yang akan di dekripsi
```bash
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
```
Digunakan untuk mengembalikan nama file hasil enkripsi menjadi nama file yang sebenarnya

## Soal 3
Kita diminta membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat " menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" serta menyimpan log message wget ke file “wget.log”.
script tersebut hanya berjalan 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu.
Kemudian membuat script untuk mengidentifikasi gambar yang identik dari keseluruhan
gambar yang terdownload. Bila terindikasi sebagai gambar yang identik, maka
disisakan 1 gambar dan sisa file identik tersebut dipindahkan ke dalam folder ./duplicate
dengan format filename "duplicate_nomor". Lalu semua gambar yang tersisa dipindahkan ke folder ./kenangan dengan format filename "kenangan_nomor". Setelah tidak ada gambar di current directory, dilakukan backup seluruh log menjadi
ekstensi ".log.bak".<br>

**Jawaban**
