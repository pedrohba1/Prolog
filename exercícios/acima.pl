sobre(d,c).
sobre(c,b).
sobre(b,a).

acimade(A,B):-
	sobre(A,B).

acimade(A,B):-
	sobre(A,X),
	acimade(X,B), !.

acimadec(A,B,C):-
	sobre(A,B),
	C is 0.

acimadec(A,B,C):-
	sobre(A,X),
	acimadec(X,B,C1),
	C is C1 +1,!.

entre(A,B,[]):-
	sobre(A,B),!.

entre(A,B,[H|T]):-
      sobre(A,H),
      entre(H,B,T).


entre_quantos(A,B,[],C):-
	sobre(A,B),
	C is 0.

entre_quantos(A,B, [H|T], C):-
	sobre(A,H),
	entre_quantos(H,B,T,C1),
	C is C1 +1.


concatena(L, [], L).
concatena([],L,L).
concatena([X|Y],Z , L):-
	concatena(Y,Z, L1),
	L = [X|L1].

