%para cada uma dessas funçoes que estabelecem as caracteristicas dos
% caes,sera escrita na tela a caracteristica do cachorro.




nome(diogenes):-
	write('nome: diogenes'),nl.
nome(rex):-
	write('nome: rex'),nl.
nome(patricia):-
	write('nome:patricia'),nl.
nome(douglinhas):-
	write('nome: douglinhas'),nl.

raca(rex,pitbull):-
	write('raca: pitbull'),nl.
raca(patricia, boxer):-
	write('raca: boxer'),nl.
raca(diogenes, pinscher):-
	write('raca: pinscher'),nl.
raca(douglinhas,chihuahua):-
	write('raca: chihuahua'),nl.

sexo(rex,macho):-
	write('sexo: macho'),nl.
sexo(patricia,femea):-
	write('sexo: femea'),nl.
sexo(diogenes, macho):-
	write('sexo: macho'),nl.
sexo(douglinhas,macho):-
	write('sexo: macho'),nl.

%as tres funçoes abaixo permitem encontrar um cao que seja agressivo

comportamento(rex,agressivo):-
       write('comportamento: agressivo'),nl.
comportamento(patricia,manso):-
	write('comportamento: mansa'),nl.
comportamento(diogenes, agressivo):-
	write('comportamento: extremamente agressivo'),nl.
comportamento(douglinhas, nervoso):-
	write('comportamento: nervoso, tem tremedeiras constantes'),nl.


cor(rex,preto):-
	write('pelos: pretos').
cor(patricia, branco):-
	write('pelos: brancos').
cor(diogenes, castanho):-
	write('pelos: castanhos').
cor(douglinhas, preto):-
	write('pelos: pretos').

pelo(rex,curto):-
	write(', curtos').
pelo(patricia, longo):-
	write(', longos').
pelo(diogenes, curto):-
	write(',curtos').
pelo(douglinhas, curto):-
	write(',curtos').

tipo_pelo(rex,liso):-
	write(' e lisos'),nl.
tipo_pelo(patricia, enrolado):-
	write(' e enrolados'),nl.
tipo_pelo(diogenes, liso):-
	write(' e lisos'), nl.
tipo_pelo(douglinhas, liso):-
	write(' e lisos'),nl.


nascimento(rex, 2017):-
	write('nascido em 2017'),nl.

nascimento(patricia,2015):-
	write('nascida em 2015'),nl.

nascimento(diogenes, 2012):-
	write('nascido em 2012'),nl.
nascimento(douglinhas,2010):-
	write('nascido em 2010'),nl.


tamanho(rex,grande):-
	write('tamanho: grande'),nl.
tamanho(patricia, medio):-
	write('tamanho: medio'),nl.

tamanho(diogenes,pequeno):-
	write('tamanho: pequeno (ideal para apartamentos)'),nl.

tamanho(douglinhas, pequeno):-
	write('tamanho pequeno, ideal para apartamentos'),nl.


caoguia(patricia, sim):-
	write('eh um cao guia'),nl,nl.
caoguia(diogenes, nao):-
	write('nao eh um cao guia'),nl,nl.
caoguia(rex,nao):-
	write('nao eh um cao guia'),nl,nl.
caoguia(douglinhas,nao):-
	write('nao eh um cao guia'),nl,nl.

alimentacao(rex,muita):-
	    write('Alimentacao: muita comida'),nl.
alimentacao(patricia, media):-
	write('Alimentacao: mediana'),nl.
alimentacao(diogenes,pouca):-
	write('alimentacao: pouca comida'),nl.
alimentacao(douglinhas,pouca):-
	write('alimentacao: pouca comida'),nl.

%essa funcao abaixo avalia se um cachorro pode servir de cao de guarda.
% para ser cao de guarda, ele precisa ser grande e agressivo.
%
guarda(X):-
	comportamento(X,agressivo),
	tamanho(X,grande).


domestico(X):-
	comportamento(X,manso),
	tamanho(X,medio); tamanho(X,pequeno).





% esses tres fatos abaixo sao importantes para a funcao lista(). sao
% elas que definem o valor das variaveis no comeco da funçao

cao(rex,pitbull,macho,agressivo,preto,curto,liso,2017,grande,muita,nao).
cao(diogenes,pinscher,macho,agressivo, castanho, curto,liso,2012,pequeno, pouca,nao).
cao(patricia,boxer,femea,manso,branco,longo,enrolado,2015,medio,media,sim).
cao(douglinhas,chihuahua,macho,nervoso,preto,curto,liso,2010,pequeno,pouca,nao).

% a funçao abaixo lista todos os caes presentes nessa BD. para usa-la,
% basta digitar "lista().".
lista():-
	cao(Dog,Raca,Sexo,Comport,Cor,Pelo,Tipo_pelo,Data,Tam,Aliment,Guia),
	nome(Dog),
	raca(Dog,Raca),
	sexo(Dog,Sexo),
	comportamento(Dog,Comport),
	cor(Dog,Cor),
	pelo(Dog,Pelo),
	tipo_pelo(Dog,Tipo_pelo),
	nascimento(Dog,Data),
	tamanho(Dog,Tam),
	alimentacao(Dog,Aliment),
	caoguia(Dog,Guia).



















