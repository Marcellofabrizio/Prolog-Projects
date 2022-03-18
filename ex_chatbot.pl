
% 3. Teste o seguinte código Prolog e comente cada uma de suas linhas.

% Robô de conversação.

% Program Name: chatterbot1
% Description: this is a very basic example of a chatterbot program
%
% Author: Gonzales Cenelia
% Date: 7 august 2009
%
response_database([
        ['I HEARD YOU!'],
        ['SO, YOU ARE TALKING TO ME.'],
        ['CONTINUE, I'M LISTENING.'],
        ['VERY INTERESTING CONVERSATION.'],
        ['TELL ME MORE...']]).

select(0, [H|T], H).
select(N, [H|T], L) :- N > 0, N1 is N - 1, select(N1, T, L).

quit_session(X):- X = 'bye',
        nl, write('IT WAS NICE TALKING TO YOU USER, SEE YOU NEXT TIME!').

write_string([H|T]):- write(H).

chatterbot1:-
        repeat,
        nl, write('>'),
        read(Input),
        response_database(ListOfResponse),
        IndexOfResponse is integer(random(5)),
        select(IndexOfResponse, ListOfResponse, Response),
        write_string(Response),
        quit_session(Input).