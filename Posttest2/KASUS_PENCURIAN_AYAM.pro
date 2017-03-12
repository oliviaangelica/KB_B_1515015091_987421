% KASUS PENCURIAN AYAM MILIK OLIVIA %

Predicates
nondeterm terdakwa(symbol,symbol)
korban(symbol,symbol)
meninggalkan_jejak(symbol)
kepemilikan(symbol,symbol)
alasan(symbol)
nondeterm pencuri(symbol)
nondeterm kemungkinan_milik(symbol,symbol)
nondeterm dicurigai(symbol)

Clauses
terdakwa(iky,buruh).
terdakwa(reja,petani).
terdakwa(ibal,nelayan).

korban(olivia,ayam).
alasan(ngidam).
meninggalkan_jejak(hp_samsung).

kepemilikan(iky,hp_iphone).
kepemilikan(reja,hp_samsung).
kepemilikan(ibal,hp_asus).

kemungkinan_milik(X,Benda):-
	  kepemilikan(X,Benda).

dicurigai(X):-
alasan(ngidam),
terdakwa(X,petani).
	
pencuri(Pencuri):-
terdakwa(Pencuri,_),
dicurigai(Pencuri).

Goal
pencuri(X).