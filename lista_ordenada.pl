x([]).
x([_]).
x([A,B|C]) :-
    A =< B,
    x(B|C).