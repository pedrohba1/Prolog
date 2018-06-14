% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

% se a relação não aparece mais de uma vez não tem necessidade de usar
% xfy ou xfx

:-op(80,xfx,gera).
:-op(50,xfx, concatena).
conc([],L, L).
conc( [H|T1], L2, [H|T3]):-
	conc(T1,L2,T3).


concat([],[]).
concat([X|T], L):-
	concat(T,Laux),
	conc(X,Laux,L).



:-op(60,xfx,ou).
:-op(50,yfx,e).
:-op(70,fx,se).
:-op(50,xfx,entao).
pai(joao,wagner).
filho(wagner,joao).

se X entao Y:-
	X = true,
	Y = true;
	X = false,
	Y = true;
	X = false,
	Y = false.


X ou Y:-
	X;Y.
X e Y:-
	X,Y.






