%PREDICADOS - FATOS
% evento(SUJEITO, VERBO,OBJETO).
evento(ana,comprou,bicicleta).
evento(ana,comprou,livro).
evento(mario,vendeu,carro).
evento(julia,alugou,casa).
evento(paulo,comprou, moto).
evento(ana,ganhou,boneca).
evento(ana,ganhou,chaveiro).

%REGRA
regra1(QUEM,X,Y):-  
    evento(QUEM,comprou,X),
    evento(QUEM,ganhou,Y).
