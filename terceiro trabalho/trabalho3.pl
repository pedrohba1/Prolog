% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

inicio :-
	repeat,
	hipotetiza(Animal),
	write('O animal eh: '),
	write(Animal),
	nl,
	write('deseja buscar outro animal?'),
       verifica_resposta.

/* hipoteses a serem testadas*/
hipotetiza(leopardo) :- leopardo, !.
hipotetiza(tigre) :- tigre, !.
hipotetiza(girafa) :- girafa, !.
hipotetiza(zebra) :- zebra, !.
hipotetiza(avestruz) :- avestruz, !.
hipotetiza(pinguim) :- pinguim, !.
hipotetiza(albatroz) :- albatroz, !.
hipotetiza(desconhecido). /* nao diagnosticado */

/* regras de identifica��o do animal */
leopardo :-
	mamifero,
	carnivoro,
	verifica(tem_manchas_escuras).
tigre :-
	mamifero,
	carnivoro,
	verifica(tem_listras_pretas).
girafa :-
	ungulado,
	verifica(tem_pescoco_grande),
	verifica(tem_pernas_grandes).
zebra :-
	ungulado,
	verifica(tem_listras_pretas).
avestruz :-
	passaro,
	verifica(nao_voa),
	verifica(tem_pescoco_grande).
pinguim :-
	passaro,
	verifica(nao_voa),
	verifica(nada),
	verifica(branco_e_preto).
albatroz :-
	passaro,
	verifica(aparece_em_estoria_de_marinheiro),
	verifica(voa).

/* regras de classifica��o */

mamifero :-
	verifica(tem_pelo), !.
mamifero :-
	verifica(amamenta).
passaro :-
	verifica(tem_penas), !.
passaro :-
	verifica(voa),
	verifica(poe_ovos).
carnivoro :-
	verifica(come_carne), !.
carnivoro :-
	verifica(tem_dentes_pontiagudos),
	verifica(tem_garras).
ungulado :-
	mamifero,
	verifica(tem_cascos), !.
ungulado :-
	mamifero,
	verifica(rumina).

/* formulando perguntas */
pergunta(Pergunta) :-
	write('O animal tem a seguinte caracteristica: '),
	write(Pergunta),
	write('? '),
	get(Resposta),
	nl,
	trate(Pergunta,Resposta).

trate(Pergunta,Resposta) :-
	Resposta == s,
	assert(sim(Pergunta)),!.
trate(Pergunta,_) :-
	assert(nao(Pergunta)),fail.

:- dynamic sim/1,nao/1.

/* verificando */

verifica(S) :- sim(S),!.
verifica(S) :- nao(S),!, fail.
verifica(S) :- pergunta(S).

/* remove todas as assercoes de sim e nao */
/*
removeRespostas :- retract(sim(_)),fail.
removeRespostas :- retract(nao(_)),fail.
*/
removeRespostas :-
	%abolish(sim/1), abolish(nao/1),dynamic(sim/1),dynamic(nao/1).
	retractall(sim(_)),
	retractall(nao(_)).


verifica_resposta:-
	repeat,
	get(C),
	(  C = 110 -> write('fechando'),nl;
	C = 115 ->inicio;
	write('resposta n�o aceita'),nl,
	write('digite somente s ou n'),nl,
	verifica_resposta).





menu:-
       write('escreva 1 para advinhar'),nl,
       write('escreva 2 para especificar'),nl,
       write('escreva 3 para evidenciar'),nl,
       write('escreva 4 para visualizar'),nl,
       write('escreva 5 para remover respostas'),nl,
       write('escreva 6 para sair'),nl,
       read(C),
       opcao(C).


opcao(1):-
	inicio.
opcao(2):-
	write('escreva a caracteristica que quer inserir'),nl,
	read(Carac),
	assertz(sim(Carac)).

opcao(4):-
	listing(sim/1),
	listing(nao/1).

opcao(5):-
	removeRespostas.

opcao(6):-
	removeRespostas,
	write('fechando...').








