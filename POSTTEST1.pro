domains % domains menyatakan jenis suatu variabel, seperti tipe data dalam bahasa prosedural
alas,panjang = integer % disini variabel alas dan panjang bertipe data integer

predicates % predicates digunakan untuk mendeklarasikan predikat
luas_persegipanjang(panjang,panjang,panjang) - procedure (i,i,o) %mendeklarasikan predikat dengan nama luas_persegipanjang, tipe argumen terdapat didalam kurung. procedure i untuk input dan o output
luas_segitiga(alas,alas,alas) - procedure (i,i,o)

clauses % clauses digunakan untuk mendefinisikan predikat, terdiri dari fakta dan aturan
luas_persegipanjang(X,Y,Luas_persegipanjang):- %aturan disini merupakan aturan luas persegipanjang yang terdapat variabel X,Y dan Luas_persegipanjang, Simbol :- diucapkan dengan “jika” dan memisahkan dua bagian dari aturan yaitu head dan body
	Luas_persegipanjang = X*Y. %ini adalah rumus luas persegi panjang yg merupakan perkalian variabel x dan y. diakhiri dengan tanda titik berarti akhir pernyataan
luas_segitiga(X,Y,Luas_segitiga):- 
	Luas_segitiga = 0.5*X*Y.
	
	
goal %goal adalah tempat pernyataan
luas_persegipanjang(5,8,Luas_persegipanjang), %disini adalah tempat pernyataan untuk nilai x adalah 5 dan y adalah 8 dari luas persegi panjang yang berupa output. tanda koma berfungsi sebagai and
luas_segitiga(2,3,Luas_segitiga). %tempat pernyataan input nilai x dan y, serta output luas segitiga. penulisan di akhiri dengan tanda titik
	
		

