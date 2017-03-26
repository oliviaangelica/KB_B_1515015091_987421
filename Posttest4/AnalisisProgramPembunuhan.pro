/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH04E12.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

/*****************************************************************************
Dalam menganalisa contoh program pembunuhan ini, saya menganalisa dengan menggunakan bahasa indonesia
untuk memudahkan semua pihak lebih mengerti, dan saya juga mengartikan domains, predicates, clauses dan goal
pada program ini kedalam bahasa indonesia. by Olivia Angelica M. 1515015091
******************************************************************************/



trace
domains							% Domains berfungsi untuk menyatakan jenis variabel atau argumen
  name,sex,occupation,object,vice,substance = symbol	% Dalam program ini terdapat domains nama, jenis kelamin, pekerjaan,benda, alasan dan zat yang menggunakan tipe data symbol 
  age=integer						% Ada domains umur yang bertipe data integer 

predicates						% Predicates berfungsi untuk mendeklarasikan predikat yg digunakan dalam bahasa prolog. Menggambarkan relasi/sifat objek
  nondeterm person(name,age,sex,occupation)		% Terdapat predikat orang yang mempunyai relasi nama, umur, jenis kelamin dan pekerjaan
  nondeterm had_affair(name,name)			% Predikat selingkuh mempunyai relasi nama dan nama
 	 killed_with(name,object)			% Predikat terbunuh_dengan mempunyai relasi nama dan benda apa
	 killed(name)					% Predikat terbunuh mempunyai relasi yaitu nama
  nondeterm killer(name)				% Predikat pembunuh mempunyai relasi yaitu parameter nama
  	motive(vice)					% Predikat motif mempunyai relasi yaitu parameter alasan
  	smeared_in(name,substance)			% Predikat ternodai mempunyai relasi yaitu dengan parameter nama dan zat
  	owns(name,object)				% Predikat milik mempunyai relasi yaitu parameter nama dan benda
  nondeterm operates_identically(object,object)		% Predikat cara_kerja_mirip mempunyai relasi yaitu parameter benda dan benda
  nondeterm owns_probably(name,object)			% Predikat kemungkinan_milik mempunyai relasi yaitu parameter nama dan benda
  nondeterm suspect(name)				% Predikat dicurigai mempunyai relasi yaitu parameter nama

/* * * Facts about the murder * * */			% Fakta-fakta tentang pembunuhan
clauses							% clauses digunakan untuk mendefinisikan predikat. Terdiri dari fakta dan aturan
  person(bert,55,m,carpenter).				% pada baris ini terdapat fakta dari predikat orang, yaitu bert seorang tukang kayu yang berumur 55 tahun dengan jenis kelamin m (man/laki-laki)
  person(allan,25,m,football_player).			% fakta dari predikat orang, yaitu allan seorang pemain sepak bola yang berumur 25 dengan jenis kelamin m
  person(allan,25,m,butcher).				% fakta dari predikat orang, yaitu allan seorang tukang daging yang berumur 25 dengan jenis kelamin m
  person(john,25,m,pickpocket).				% fakta dari predikat orang, yaitu john seorang seorang pencopet yang berumur 25 dengan jenis kelamin m

  had_affair(barbara,john).				% terdapat pula fakta dari predikat selingkuh, yaitu barbara berselingkuh dengan john
  had_affair(barbara,bert).				% fakta dari predikat selingkuh, yaitu barbara berselingkuh dengan bert
  had_affair(susan,john).				% fakta dari predikat selingkuh, yaitu susan berselingkuh dengan john

  killed_with(susan,club).				% ada juga fakta dari prediket terbunuh_dengan, yaitu susan terbunuh dengan tongkat pemukul
  killed(susan).					% dan fakta terbunuh, yaitu susan (yang terbunuh)

  motive(money).					% fakta dari predikat motif, yaitu uang
  motive(jealousy).					% fakta dari predikat motif, yaitu cemburu
  motive(righteousness).				% fakta dari predikat motif, yaitu dendam

  smeared_in(bert,blood).				% fakta dari predikat ternodai, yaitu bert ternodai dengan darah
  smeared_in(susan,blood).				% fakta dari predikat ternodai, yaitu susan ternodai dengan darah
  smeared_in(allan,mud).				% fakta dari predikat ternodai, yaitu allan ternodai dengan lumpur
  smeared_in(john,chocolate).				% fakta dari predikat ternodai, yaitu john ternodai dengan coklat
  smeared_in(barbara,chocolate).			% fakta dari predikat ternodai, yaitu barbara ternodai dengan coklat

  owns(bert,wooden_leg).				% fakta dari predikat milik, yaitu bert memiliki kaki palsu
  owns(john,pistol).					% fakta dari predikat milik, yaitu john memiliki pistol

/* * * Background knowledge * * */			% basis pengetahuan

  operates_identically(wooden_leg, club).		% fakta dari cara_kerja_mirip, yaitu cara kerja kaki palsu mirip dengan tongkat pemukul
  operates_identically(bar, club).			% fakta dari cara_kerja_mirip, yaitu cara kerja balok mirip dengan tongkat pemukul
  operates_identically(pair_of_scissors, knife).	% fakta dari cara_kerja_mirip, yaitu cara kerja sepasang gunting mirip dengan pisau
  operates_identically(football_boot, club).		% fakta dari cara_kerja_mirip, yaitu cara kerja sepatu bola mirip dengan tongkat pemukul

  owns_probably(X,football_boot):-			% Kemungkinan sepatu bola adalah milik X, jika maka
	person(X,_,_,football_player).			% X dan orang lainnya (sembarang) adalah pemain bola, maksudnya adalah kemungkinan sepatu bola adalah milik X jika X adalah salah satu dari pemain bola
  owns_probably(X,pair_of_scissors):-			% Kemungkinan sepasang gunting adalah milik X, jika maka
	person(X,_,_,hairdresser).			% X dan orang lainnya (sembarang) adalah penata rambut, maksudnya adalah kemungkinan sepasang gunting adalah milik X jika X adalah salah satu dari penata rambut
  owns_probably(X,Object):-				% Kemungkinan benda adalah milik X, jika maka
	owns(X,Object).					% X memiliki benda itu, maksudnya adalah kemungkinan benda adalah milik X, jika X memiliki benda itu

/* * * * * * * * * * * * * * * * * * * * * * *
 * Suspect all those who own a weapon with   *	------> dicurigai semua orang yang memiliki senjata yang cara kerjanya mirip dengan senjata penyebab susan terbunuh	
 * which Susan could have been killed.        *
 * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-						% X dicurigai jika maka
	killed_with(susan,Weapon) ,			% susan terbunuh dengan senjata dan
	operates_identically(Object,Weapon) ,		% cara kerta benda tersebut mirip dengan senjata dan
	owns_probably(X,Object).			% kemungkinan X memiliki benda tersebut

/* * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect men who have had an affair with Susan.  * --> dicurigai laki-laki yang selingkuh dengan susan
 * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-						% X dicurigai jika maka 
	motive(jealousy),				% cemburu adalah motifnya, dan
	person(X,_,m,_),				% X adalah salah satu dari orang yang berjenis kelamin m (laki-laki), dan
	had_affair(susan,X).				% susan berselingkuh dengan X

/* * * * * * * * * * * * * * * * * * * * *
 * Suspect females who have had an       * -----------> dicurigai perempuan yang selingkuh dengan laki-laki yang juga selingkuh dengan susan
 * affair with someone that Susan knew.  *
 * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-      					% X dicurigai jika maka
	motive(jealousy),				% cemburu adalah motifnya, dan
	person(X,_,f,_),				% X adalah salah satu orang yang berjenis kelamin f (female/perempuan), dan
	had_affair(X,Man),				% X berselingkuh dengan seorang laki-laki, dan
	had_affair(susan,Man).				% Susan berselingkuh dengan laki-laki tersebut

/* * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect pickpockets whose motive could be money.  * ---> dicurigai pencopet yang mempunyai motif uang
 * * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-						% X dicurigai jika maka
	motive(money),					% uang adalah motifnya, dan
	person(X,_,_,pickpocket).			% X adalah salah satu dari seorang pencopet.

  killer(Killer):-					% pembunuh tersebut dikatakan seorang pembunuh jika maka
	person (Killer,_,_,_),				% orang tersebut adalah pembunuh dan orang lainnya sembarang, dan
	Killed(Killed),					% jika orang terbunuh dan
	Killed <> Killer, /* It is not a suicide ---> bukan bunuh diri */ % relasi dari tebunuh adalah pembunuh dan
	suspect(Killer),				% pembunuh tersebut dicurigai, dan
	smeared_in(Killer,Goo),				% pembunuh ternodai oleh zat, dan
	smeared_in(Killed,Goo).				% yang terbunuh juga ternodai oleh zat.

GOAL							% goal adalah tempat pernyataan yang diberikan atau meminta prolog untuk mencapai tujuan yang dikehendaki
killer(X).						% Jawaban dari pembunuh tersebut adalah bert, karena teridentifikasi pembunuh yang ternodai zat adalah bert. 
 							% dalam aturan (clauses) diatas terdapat dua aturan yang teridentifikasi yaitu susan dan bert ternodai dengan zat yaitu darah
 							% dan juga teridentifikasi bahwa susan adalah orang yang terbunuh 
 							% oleh karena itu pada goal ini dinyatakan X adalah seorang pembunuhnya, dan dari fakta dan aturan diatas maka X atau pembunuhnya adalah bert 
 							