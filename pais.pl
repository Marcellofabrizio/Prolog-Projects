% FATOS
pais(márcio, miguel).
pais(márcio, paula).
pais(márcio, carlos).
pais(miguel, fábio).
pais(carlos, josé).
pais(carlos, alex).
pais(carlos, renata).
pais(ana, fábio).

% REGRAS
% CONCLUSÃO
%   PREM1,
%   PREM2,
%   ...
%   PREMN.

avo(X,Y):-
    pais(X,Z),
    pais(Z,Y).
% -----------------------------------------------------------

%FATOS

homem(carlos).
homem(márcio).
homem(miguel).
homem(fábio).
homem(josé).
homem(alex).
mulher(ana).
mulher(paula).
mulher(renata).

% REGRAS
filho(X,Y):-
    pais(Y,X),
    homem(X).

filha(X,Y):-
    pais(Y,X),
    mulher(X).

pai(X,Y):-
    filho(Y,X),
    homem(X).

mae(X,Y):-
    pais(Y,X),
    mulher(X).

irmao(X,Y):-
    X\=Y,
    pais(Z, X),
    pais(Z, Y),
    homem(X).

irma(X,Y):-
    X\=Y,
    pais(Z, X),
    pais(Z, Y),
    mulher(X).

irmaos(Px, Py):-
    irmao(Px, Py);
    irma(Px, Py).

primos(X,Y):-
    X\=Y,
    pais(Px, X),
    pais(Py, Y),
    irmao(Px, Py).