
teste:-
      tell('/home/pedro/Documentos/Prolog/estudo em arquivos/copiar arquivos/arquivo1.pl'),
      read(Termo),
      write(Termo),
      told.


% a funçao acima vai sobrescrever o que voce colocar no read para o
% arquivo. tudo que tinha no arquivo antes vai ser apagado e vai
% aparecer o que esta no read.


teste1:-
      append('/home/pedro/Documentos/Prolog/estudo em arquivos/copiar arquivos/arquivo1.pl'),
      read(Termo),
      write(Termo),
      told.

testechar:-
	append('/home/pedro/Documentos/Prolog/estudo em arquivos/copiar arquivos/arquivo1.pl'),
	get(A),
	put(A),
	told.


verifica(115,sim):-
	write('executando...').
verifica(110,nao):-
	write('parando...').


resposta(R):-
	nl,
	write('s ou n?:'),nl,
	get(Resp),
	get0(_),
	verifica(Resp,R),!.
resposta(R):-
	write('voce nao deu a respota certa!'),
	resposta(R).



sn(1,sim).
sn(0,nao):-
	fail.

oraculo:-
     nl,
     write('escreva sua pergunta:'),
     nl,
     get(_),
     get0(_),
     random(-1,2,R),
     sn(R,_).

le_str(String) :-
get0(Char),
le_str_aux(Char, String).
le_str_aux(-1, []) :- !. % EOF
le_str_aux(10, []) :- !. % EOL(UNIX)
le_str_aux(13, []) :- !. % EOL (DOS)
le_str_aux(Char, [Char|Resto]) :-
le_str(Resto).

le_atom(X):-
	le_str(String),
	name(X,String).

calcula_dobro:-
	le_atom(X),
	Y is 2*X,
	write('o dobro de'),
	write(X),
	write('eh'),
	write(Y).


