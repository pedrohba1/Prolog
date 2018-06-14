
homem(maximo).
homem(adiel).
homem(leo).
mulher(ligia).
mulher(maria).
mulher(poliana).

idade(maximo,20).
idade(adiel,18).
idade(leo,19).
idade(ligia,12).
idade(maria,16).
idade(poliana,21).

gosta_de(maximo,calculo1).
gosta_de(adiel,calculo1).
gosta_de(leo,pci).
gosta_de(ligia,python).
gosta_de(maria,pci).
gosta_de(poliana,calculo1).

cor_olhos(maximo,preto).
cor_olhos(adiel,preto).
cor_olhos(leo,verde).
cor_olhos(ligia,azul).
cor_olhos(maria,verde).
cor_olhos(poliana,preto).

cor_pele(maximo,pardo).
cor_pele(adiel,pardo).
cor_pele(leo,pardo).
cor_pele(ligia,branca).
cor_pele(maria,pardo).
cor_pele(poliana,branca).

cor_cabelo(maximo,preto).
cor_cabelo(adiel,preto).
cor_cabelo(leo,loiro).
cor_cabelo(ligia,loiro).
cor_cabelo(maria,loiro).
cor_cabelo(poliana,preto).

esporte(maximo,futebol).
esporte(adiel,futebol).
esporte(leo,volei).
esporte(ligia,basquete).
esporte(maria,volei).
esporte(poliana,futebol).

contato(maximo,0101010).
contato(adiel,0800777).
contato(leo,9090190).
contato(ligia,9974054).
contato(maria,9985432).
contato(poliana,9918564).

altura(maximo,184).
altura(adiel,175).
altura(leo,170).
altura(ligia, 160).
altura(maria,170).
altura(poliana,175).

peso(maximo,80).
peso(adiel,78).
peso(leo,75).
peso(ligia,50).
peso(maria,70).
peso(poliana,73).


gosto_comum(X,Y):-
	gosta_de(X,N),
	gosta_de(Y,N),
	esporte(X,E),
	esporte(Y,E),
	cor_pele(X,P),
	cor_pele(Y,P),
	cor_olhos(X,R),
	cor_olhos(Y,R).

id_aprox(X,Y):-
	X - Y < 3.

peso_aprox(X,Y):-
	X - Y < 15.

altura_aprox(X,Y):-
	X - Y < 15.

compativel(X,Y):-
	homem(X),mulher(Y),
	idade(X,Idx), idade(Y,Idy),
	id_aprox(Idx,Idy),
	gosto_comum(X,Y).

compativel(X,Y):-
       homem(Y), mulher(X),
       idade(Y,Idy), idade(X,Idx),
       id_aprox(Idy,Idx),
       gosto_comum(X,Y).




