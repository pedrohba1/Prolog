
entrada(sopa).
entrada(salada).

carne(cupim).
carne(picanha).
peixe(dourado).
peixe(pacu).
ave(frango).


sobremesa(sorvete).

prato_principal(P):-
	peixe(P).
prato_principal(P):-
	carne(P).
prato_principal(P):-
	ave(P).

refeicao(Ent,Princ,Sobr):-
	entrada(Ent),
	prato_principal(Princ),
	sobremesa(Sobr).




