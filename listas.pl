pertence(X,[X|_]) :- !.
pertence(X,[_|Y]) :-
    pertence(X,Y).

ultimo([U],U) :- !.
ultimo([_|X],U) :-
    ultimo(X,U).

max_de_dois(X,Y,X) :-
    X >= Y.
max_de_dois(X,Y,Y) :-
    X < Y.
max([X],X) :- !.
max([X,Y|REST],M) :-
    max([Y|REST],MREST),
    max_de_dois(X,MREST,M).