

%This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.


%n-ésimo elemento de uma PA feito usando recursão em cauda:
pat(1,Elem,_,Elem).
pat(N,First,Ratio, Elem):-
	N  >1,
	N1 is N-1,
	Next is First+Ratio,
	pat(N1,Next,Ratio,Elem),!.
%n-ésimo elemento de uma PA feito usando recursão comum:
pa(1,Elem,_,Elem).
pa(N,First, Ratio, Elem):-
	N>1,
	N1 is N-1,
	pa(N1,First,Ratio,Elemaux),
	Elem is Elemaux + Ratio.
%Soma dos termos da PA feito usando recursao comum:
somapa(1,First,Ratio,S1):-
	pa(1,First,Ratio,Elem),
	S1 is Elem.
somapa(N,First,Ratio,S):-
	N>1,
	pa(N,First,Ratio,Elem),
	N1 is N-1,
	somapa(N1,First,Ratio,Saux),
	S is Saux + Elem.


%Soma os termos de uma Pa usando recursão em cauda:
somapat(1,Elem,_,Elem).
somapat(N,First,Ratio,S):-
	N>1,
	pat(N,First,Ratio,Next),
	N1 is N-1,
	somapat(N1,Next,Ratio,S),!.


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

%7. Tire elemento (pela posiçao):
% Exemlpo:  tire_elemento(X,[1,2,3],3,L).
tire_elemento(X, [X|T], 1, T).
tire_elemento(X, [Y|Xs], K, [Y|Ys]):-
	K >1,
	K1 is K-1,
	tire_elemento(X,Xs,K1,Ys).


%7.2 Tire elemento (pelo elemento):

tire_elemento2(X, [X|Y], Y).
tire_elemento2(X, [Y|T1], [Y|T2]):-
	tire_elemento2(X,T1,T2),!.


%*8 e 9 - retirar ocorrências de uma lista:
retirar_ocor(_,[],[]).
retirar_ocor(X, [X|Xs], Y):-
	retirar_ocor(X,Xs,Y).
retirar_ocor(X, [T|Xs], [T|Y]):-
       X \= T ,
	retirar_ocor(X,Xs,Y).


%10. retirar_repetidos:
pertence(X,[X|_]).
pertence(X,[_|T]):-
	pertence(X,T),!.


retire_repet([],[]).
retire_repet([H|T], L):-
	pertence(H,T),
	retire_repet(T,L).
retire_repet([H|T],[H|T1]):-
	not(pertence(H,T)),
	retire_repet(T,T1).


%11. concatenar duas listas


concatenar([],L,L).
concatenar([H|T],L2, [H|L3]):-
	concatenar(T,L2,L3).

%12. encontrar o maior elemento:


maior([E|[]],E).
maior([H|T],E):-
	maior(T,E1),
	(H >E1 -> E = H; E = E1),!.

%13. encontrar o menor elemento:


menor([E|[]], E).
menor([H|T],E):-
	menor(T,E1),
	(H < E1 -> E = H; E= E1),!.

%14.pegar elementos de uma lista dada a lista de suas posições:

pegar([],_,[]).
pegar([Hp|Tp],L,Lr):-
	pegar(Tp,L,Lr1),
	tire_elemento(X,L,Hp,_),
	inserir_cabeça(X,Lr1,Lr),!.




%15. Inserir o elemento na primeira posição:

inserir_cabeça(E, L, [E|L]).


%16.Inserir em uma posiçao N:


inserir_N(Elem, 1, L, [Elem|L]).
inserir_N(Elem, N, [H|T1], [H|L2]):-
	N >1,
	N1 is N -1,
	inserir_N(Elem, N1, T1,L2).


%17.Inverter uma lista:

inverter([],[]).
inverter([H|T],L):-
	inverter(T,Laux),
	insere_final(H,Laux,L),!.

%18.substituir um elemento de uma lista por outro elemento:
%OBS: nesse caso, coloca o X no lugar do Y.
substitui(X,Y,[X|T],[Y|T]).
substitui(X,Y,[H|L],[H|Lr]):-
	substitui(X,Y,L,Lr).


%19.Duplicar elementos em uma lista:
duplicar_todos([],[]).
duplicar_todos([H|T],[H,H|L]):-
	duplicar_todos(T,L).

%20. Duplicar um único elemento:

duplicar_um(E,[E|T], [E,E|T]).
duplicar_um(E, [H|T], [H|L2]):-
	duplicar_um(E,T,L2),!.


%21. Verificar se a intersecção de dois conjuntos
%não é vazia:


vazia([],_).
vazia([H|L],L2):-
	vazia(L,L2),
	not(pertence(H,L2)).

nao_vazia(X,Y):- not(vazia(X,Y)).

%EXTRA: insere final:

insere_final(X, [],[X]).
insere_final(X,[H|[]],[H,X]).
insere_final(X,[H|L1],[H|L2]):-
	insere_final(X,L1,L2).

%22.uniao de dois conjuntos:
uniao(L1,L2,Lu):-
	concatenar(L1,L2,Luaux),
	retire_repet(Luaux,Lu).

%23. Verificar se dois conjuntos são disjuntos:

disjuntos(X,Y):- vazia(X,Y).

%24.verificar se dois conjuntos sao iguais:
iguais([],_).
iguais([H|L1],L2):-
	iguais(L1,L2),
	pertence(H,L2).




