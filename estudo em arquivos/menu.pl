
:- dynamic pai/2.

menu:-
	repeat,
	consult('/home/pedro/Documentos/Prolog/estudo em arquivos/dados.pl'),
	write('1-listar n relacionamentos pai'),nl,
	write('2-adicionar relacionamento pai'),nl,
	write('3-remove relacionamento pai'),nl,
	write('4-sair'),nl,
	read(X),
	(X=4, write('fechando'), nl;
	opcao(X),fail).

opcao(1):-!,
	listing(pai/2).
opcao(2):-!,
	write('escreva o nome do pai'),nl,
	read(X),
	write('escreva o nome do filho'),nl,
	read(Y),
	assertz(pai(X,Y)),
	tell('/home/pedro/Documentos/Prolog/estudo em arquivos/dados.pl'),
	listing(pai/2),
	told.


opcao(3):-!,
	nl,
	write('escreve o pai que quer remover'),nl,
	read(X),
	write('escrev1a o filho que quer remover'),nl,
	read(Y),
	retract(pai(X,Y)),
	tell('/home/pedro/Documentos/Prolog/estudo em arquivos/dados.pl'),
	listing(pai/2),
	told.















