% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

%n-ésimo termo de um PA


nelemento(H, [H|_], 1):- !.
nelemento(X, [_|T],  K):-
	K >1,
	K1 is K-1,
	nelemento(X,T,K1).

pa(1,Elem,_,Elem).
pa(N,First,Ratio, Elem):-
	N  >1,
	N1 is N-1,
	Next is First+Ratio,
	pa(N1,Next,Ratio,Elem).


