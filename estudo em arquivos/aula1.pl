
%see('/home/pedro/Documentos/Prolog/segundo trabalho/trabalho.pl'),
% read(X),write(X), seen.

% a funçao "see" muda o leitor padrao de entrada do teclado para o
% arquivo, ai quando voce chama o read(X), ele vai ler do arquivo que
% voce mandou. o "seen" serve pra mudar o leitor padrao de volta pro
% teclado




% a funçao read(_) so le ate o ponto na linha.
% se voce quer ler um arquivo inteiro tem que usar isso aqui embaixo:

processa_arquivo:-
	read(T),
	processa_termo(T).
%isso aqui embaixo é pra copiar um arquivo pra outro arquivo:

copia(A1,A2):-
	see(A1),
	tell(A2),
	processa_arquivo,
	seen,
	told.


processa_termo(end_of_file):-!.
processa_termo(T):-
	write(T),
	processa_arquivo.




