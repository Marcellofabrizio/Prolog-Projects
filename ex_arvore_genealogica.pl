% 1. A Árvore Genealógica da Família Pinheiro (do livro [Brakto, 1990])

% Enunciado: Pouco se sabe da história passada da família Pinheiro. 
% Existem alguns registos antigos que indicam que o casal José e Maria criou dois filhos, o João e a Ana. 
% Que a Ana teve duas filhas, a Helena e a Joana, também parece ser verdade, segundo os
% mesmos registos. Além disso, o Mário é filho do João, pois muito se orgulha disso. 
% Estranho também, foi constatar que o Carlos nasceu da relaçãoo entre a Helena e o Mário.

% a) Utilizando o predicado progenitor(X,Y) (ou seja, X é progenitor de Y),
% represente em Prolog todos os progenitores da família Pinheiro.

% b) Represente em Prolog as relações: sexo (masculino ou feminino), irmã,
% irmão, descendente, mãe, pai, avô, avó, tio, tia, primo, prima.

% c) Formule em Prolog as seguintes questões:

% 1. O João é filho do José? 


% 2. Quem são os filhos da Maria?


% 3. Quem são os primos do Mário?


% 4. Quantos sobrinhos/sobrinhas com um Tio existem na família Pinheiro?


% 5. Quem são os ascendentes do Carlos?


% 6. A Helena tem irmãos? E irmãs?

sexo(masc, jose).
sexo(masc, joao).
sexo(masc, mario).
sexo(masc, carlos).

sexo(fem, ana).
sexo(fem, maria).
sexo(fem, joana).
sexo(fem, helena).

progenitor(jose, joao).
progenitor(jose, ana).
progenitor(maria, joao).
progenitor(maria, ana).

progenitor(ana, helena).
progenitor(ana, joana).

progenitor(joao, mario). 

progenitor(mario, carlos). 
progenitor(helena, carlos). 

descendente(X, Y):-
    progenitor(Y, X).
descendente(X,Z):-
    progenitor(Y,X),
    descendente(Y,Z).

pais(X,Y):-
    pai(X,Y);
    mae(X,Y).

filho(X,Y):-
    pais(Y,X),
    sexo(masc,X).

filha(X,Y):-
    pais(Y,X),
    sexo(fem, X).

pai(X,Y):-
    progenitor(X,Y),
    sexo(masc, X).

mae(X,Y):-
    progenitor(X,Y),
    sexo(fem, X).

tio(X,Y):-
    sexo(masc,X),
    pais(Z,Y),
    irmaos(Z,X).

irmao(X,Y):-
    X\=Y,
    pais(Z, X),
    pais(Z, Y),
    sexo(masc, X).

irma(X,Y):-
    X\=Y,
    pais(Z, X),
    pais(Z, Y),
    sexo(fem, X).

irmaos(Px, Py):-
    irmao(Px, Py);
    irma(Px, Py).

primos(X,Y):-
    X\=Y,
    pais(Px, X),
    pais(Py, Y),
    irmaos(Px, Py).

filhos(X,Z):-
    pais(X,Z).