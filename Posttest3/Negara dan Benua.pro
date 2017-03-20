domains
benua, negara = symbol
pendapatan= integer

predicates
nondeterm pendapatan(negara,pendapatan)
nondeterm memiliki(benua,negara,negara,negara)
nondeterm mendapat(negara,negara,negara,pendapatan,pendapatan,pendapatan)
nondeterm maju(negara)
nondeterm berkembang(negara)

clauses
memiliki(asia,indonesia,singapore,malaysia).
memiliki(eropa,prancis,rusia,jerman).
memiliki(afrika,algeria,camerun,zambia).
memiliki(amerika,argentina,meksiko,brazil).

mendapat(indonesia,singapore,malaysia,60,80,60).
mendapat(prancis,rusia,jerman,80,85,80).
mendapat(algeria,camerun,zambia,60,55,50).
mendapat(argentina,meksiko,brazil,70,60,80).

pendapatan(Negara,Pendapatan):-
	mendapat(Negara,_,_,Pendapatan,_,_);
	mendapat(_,Negara,_,_,Pendapatan,_);
	mendapat(_,_,Negara,_,_,Pendapatan).

maju(Negara):-
	pendapatan(Negara,Pendapatan),Pendapatan=60;
	pendapatan(Negara,Pendapatan),Pendapatan=60;
	pendapatan(Negara,Pendapatan),Pendapatan=60.

berkembang(Negara):-
	pendapatan(Negara,_),
	not(maju(Negara)).

goal
nl,write(" * BENUA BESERTA NEGARANYA *"),nl,
write("Benua Asia --> "),memiliki(asia,Negara1,Negara2,Negara3);
write("Benua Afrika --> "),memiliki(afrika,Negara1,Negara2,Negara3);
write("Benua Eropa --> "),memiliki(eropa,Negara1,Negara2,Negara3);
write("Benua Amerika --> "),memiliki(amerika,Negara1,Negara2,Negara3);
nl,write("* NEGARA BERKEMBANG *"),nl,berkembang(Negara);
nl,write("* NEGARA MAJU *"),nl,maju(Negara);
nl,write("* BENUA *"),nl,memiliki(Benua,_,_,_);
nl,write("* NEGARA *"),nl,memiliki(_,Negara1,Negara2,Negara3).