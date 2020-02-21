BEGIN { FS = "[/ || ' ']" }

 /Location/ {
   print $5 >"/home/raferto/Documents/4. Sisop/Praktikum 1/Soal 3/Foto/Location.log"
   getline;getline;getline;getline;getline
   print $12 >"/home/raferto/Documents/4. Sisop/Praktikum 1/Soal 3/Foto/Location.log"
 }
