

pai(pedro,maria).
pai(jose,pedro).
pai(manuel,jose).


ancestral(X,Y):-
	pai(X,Y).

ancestral(X,Y):-
	pai(X,Z),
	pai(Z,Y).




ancestral_grau(A,B,G):-
	pai(A,B),
	G is 0.
ancestral_grau(A,B,G):-
	pai(A,X),
	ancestral_grau(X,B,G2),
	G is G2 +1.

