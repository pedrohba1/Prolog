socio(joao,aau).
socio(suzana,aau).
socio(basilio,aau).
socio(elvira,aaau).


irmaos(basilio,elivra).

irmaos(A,B):-
	irmaos(B,A), !.



casados(joao,suzana).
casados(A,B):-
	casados(B,A),!.


