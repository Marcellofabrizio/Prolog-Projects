% 2. Teste o seguinte código prolog e comente cada uma de suas linhas.
% Aprendendo as capitais do Brasil

:-dynamic capital/2.

% Construa uma lista de pares (estado, capital)
capital(manaus, amazonas).
capital(macapa, amapa).
capital(terezina, piaui).

% Predicado encontraCapital
encontraCapital :-
write('Informe o Estado: '),
read(Estado),
pesquisaCapital(Estado).

% Procura por capital(Estado, Cidade). Se encontrar, então a
% escreve.
pesquisaCapital(Estado) :-
capital(Capital,Estado),
write('A Capital é: '),
write(Capital), nl.

% Se o predicado acima falhar então este será executado.
pesquisaCapital(Estado) :-
write('Não conheço este estado.'),nl,
write('Quer me informar a capital?'),nl,
write('Eu me lembrarei da proxima vez.'),
write('Pode digitar:'),
read(Capital),
assertz(capital(Capital,Estado)),
write('Obrigada!'), nl.