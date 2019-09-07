hombre(jose_arcadioI).
hombre(jose_arcadioII).
hombre(coronel_aureliano).
hombre(arcadio).
hombre(aureliano_jose).
hombre(aureliano_x17).
hombre(aureliano_segundo).
hombre(jose_arcadio_segundo).
hombre(mauricio_babilonia).
hombre(jose_arcadioIII).
hombre(gastón).
hombre(aureliano_babilonia).
hombre(aureliano).
mujer(úrsula_iguarán).
mujer(rebeca).
mujer(amaranta).
mujer(remedios_moscote).
mujer(pilar_ternera).
mujer(santa_sofia_de_la_piedad).
mujer(carmelita_montiel).
mujer(otras_x17).
mujer(fernanda_del_carpio).
mujer(remedios_la_bella).
mujer(petra_cotes).
mujer(meme).
mujer(amaranta_úrsula).
pareja(jose_arcadioI,úrsula_iguarán).
pareja(jose_arcadioII,rebeca).
pareja(coronel_aureliano,remedios_moscote).
pareja(arcadio,santa_sofia_de_la_piedad).
pareja(aureliano_segundo,fernanda_del_carpio).
pareja(gastón,amaranta_úrsula).
pareja(jose_arcadioII,pilar_ternera).
pareja(coronel_aureliano,pilar_ternera).
pareja(aureliano_jose,carmelita_montiel).
pareja(aureliano_segundo,petra_cotes).
pareja(jose_arcadio_segundo,petra_cotes).
pareja(mauricio_babilonia,meme).
pareja(aureliano_babilonia,amaranta_úrsula).
pareja(coronel_aureliano,otras_x17).
ascendente(jose_arcadioI,jose_arcadioII).
ascendente(jose_arcadioI,amaranta).
ascendente(jose_arcadioI,rebeca).
ascendente(jose_arcadioI,coronel_aureliano).
ascendente(úrsula_iguarán,rebeca).
ascendente(úrsula_iguarán,jose_arcadioII).
ascendente(úrsula_iguarán,amaranta).
ascendente(úrsula_iguarán,coronel_aureliano).
ascendente(coronel_aureliano,aureliano_x17).
ascendente(coronel_aureliano,aureliano_jose).
ascendente(pilar_ternera,aureliano_jose).
ascendente(jose_arcadioII,arcadio).
ascendente(pilar_ternera,arcadio).
ascendente(arcadio,aureliano_segundo).
ascendente(santa_sofia_de_la_piedad,aureliano_segundo).
ascendente(arcadio,remedios_la_bella).
ascendente(santa_sofia_de_la_piedad,remedios_la_bella).
ascendente(arcadio,jose_arcadio_segundo).
ascendente(santa_sofia_de_la_piedad,jose_arcadio_segundo).
ascendente(aureliano_segundo,meme).
ascendente(fernanda_del_carpio,meme).
ascendente(aureliano_segundo,jose_arcadio).
ascendente(fernanda_del_carpio,jose_arcadio).
ascendente(aureliano_segundo,amaranta_úrsula).
ascendente(fernanda_del_carpio,amaranta_úrsula).
ascendente(mauricio_babilonia,aureliano_babilonia).
ascendente(meme,aureliano_babilonia).
ascendente(aureliano_babilonia,aureliano).
ascendente(amaranta_úrsula,aureliano).

padre(X,Y):-
    ascendente(X,Y),hombre(X).
madre(X,Y):-
    ascendente(X,Y),mujer(X).
hijo(P,Q):-
    (madre(Q,P);padre(Q,P)),hombre(P).
hija(P,Q):-
    (madre(Q,P);padre(Q,P)),mujer(P).
hermano(Z,W):-
    padre(H,Z),padre(H,W),hombre(Z).
hermana(Z,W):-
    padre(H,Z),padre(H,W),mujer(Z).

abuelo(X,Y):-
    padre(X,Z),( padre(Z,Y);madre(Z,Y)).
abuela(X,Y):-
    madre(X,Z),( padre(Z,Y);madre(Z,Y)).
tio(P,Q):-
    hermano(P,H),( padre(H,Q);madre(H,Q)).
tia(P,Q):-
    hermana(P,H),( padre(H,Q);madre(H,Q)).
sobrino(P,Q):-
    (tia(Q,P);tio(Q,P)),hombre(P), not(hijo(P,Q)).
sobrina(P,Q):-
    (tia(Q,P);tio(Q,P)),mujer(P), not(hija(P,Q)).
suegro(P,Q):-
    ( pareja(Q,H);pareja(H,Q)),padre(P,H).
suegra(P,Q):-
    ( pareja(Q,H);pareja(H,Q)),madre(P,H).
nieto(X,Y):-
    ( abuelo(Y,X);abuela(Y,X)),hombre(X).
nieta(X,Y):-
     (abuelo(Y,X);abuela(Y,X)),mujer(X).
primo(P,Q):-
  (tio(X,P);tia(X,P)),padre(X,Q), hombre(P).
prima(P,Q):-
  (tio(X,P);tia(X,P)),padre(X,Q), mujer(P).
yerno(P,Q):-
  padre(Q,X),pareja(X,P), hombre(P).
cunados(A,C):-
    pareja(A,B),(hermano(B,C);hermana(B,C),not(pareja(A,C))).
