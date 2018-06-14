% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

lista([], 0).
lista([_|Y], R):-
	lista(Y,R1),
       R is R1 +1.


soma_lista([], 0).
soma_lista([X|Y], R):-
	soma_lista(Y, R1),
	R is R1 + X.


duplica_lista([],[]).
duplica_lista([X|Y], R):-
	duplica_lista(Y, Y1),
	X1 is X*2,
	R = [X1|Y1].


ultimo([X], X).
ultimo([_|Y], R):-
	ultimo(Y,R), !.


concatena([],R,R).
concatena(R,[],R).
concatena([X|Y], L, R):-
	concatena(Y,L,R1),
	R = [X|R1].








































