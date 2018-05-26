% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.


%n-ésimo elemento de uma PA feito usando recursão em cauda:
pa(1,Elem,_,Elem).
pa(N,First,Ratio, Elem):-
	N  >1,
	N1 is N-1,
	Next is First+Ratio,
	pa(N1,Next,Ratio,Elem).

%Soma dos termos da PA feito usando recursao em cauda:


somapa(1,First,Ratio,S1):-
	pa(1,First,Ratio,Elem),
	S1 is Elem.
somapa(N,First,Ratio,S):-
	N>1,
	pa(N,First,Ratio,Elem),
	N1 is N-1,
	somapa(N1,First,Ratio,S1),
	S is S1 + Elem.

%itens da questao 3:
%1.R: X = a.
%2.R: X	= [].
%3.R: False.
%4.R: X = [a].
%5.R: False.
%6.R: X=a, Y = b.
%7.R: False.
%8.R: X =a, Y = b, Z =c.
%9.R: False.
%10.R: X= a, Y=b.
%11.R: X = a, Y = [].
%12.R: False.
%13.R: X = a, Y = [b,c].
%14.R: X=a, Y = b, Z = [c].
%15.R: X = a, Y = b, Z =  [].
%16.R: False.
%17.R: X = a, Y = b,Z = [c,d].
%18.R: X = a, Y = b, Z = [a].
%19.R: X = Z, Y= b, Z = [a].

%4.N-ésimo elemento de uma lista:

n_esimo(H, [H|_], 1).
n_esimo(X, [_|T],  K):-
	K >1,
	K1 is K-1,
	n_esimo(X,T,K1).


%5.Número de elementos de uma lista:

n_elementos([],0).
n_elementos([_|L], N):-

	n_elementos(L,N1),
	N is N1 +1.


%6. Retirar a primeira ocorrencia
%de uma lista:

retira_primeiro([_|T], T).

%7. Tire elemento (nao funciona ainda):
tire_elemento(1,[_|T], T).
tire_elemento(N, [_|T], R):-
	N >1,
	N1 is N-1,
	tire_elemento(N1,T,R).






















