% Bernardo Alberto Amaro - 25014832
% Objetivo 3: Testes para o predicado extra/3

:- [regras].

ok(Descricao):-
    write('[OK] '),
    write(Descricao),
    nl.

erro(Descricao):-
    write('[ERRO] '),
    write(Descricao),
    nl.

testa_lista(Descricao, Consulta, Obtido, Esperado):-
    call(Consulta),
    Obtido == Esperado,
    ok(Descricao).

testa_lista(Descricao, Consulta, Obtido, Esperado):-
    call(Consulta),
    Obtido \== Esperado,
    erro(Descricao),
    write('  Esperado: '),
    write(Esperado),
    nl,
    write('  Obtido:   '),
    write(Obtido),
    nl.

testa_lista(Descricao, Consulta, _Obtido, _Esperado):-
    not(call(Consulta)),
    erro(Descricao),
    write('  A consulta falhou.'),
    nl.

testes_extra :-
    write('=== TESTES DO OBJETIVO 3 (EXTRA) ==='), nl,
    
    testa_lista(
        'Teste do Enunciado: extra(12808, 1, QUAIS)',
        extra(12808, 1, QUAIS),
        QUAIS,
        [circuitos_eletricos]
    ),

% Executando os testes

rodar :-
    nl,
    write('=============================================='), nl,
    write('INICIANDO TESTES DO EXERCICIO 3'), nl,
    write('=============================================='), nl, nl,
    testes_extra, nl,
    write('=============================================='), nl,
    write('FIM DOS TESTES'), nl,
    write('=============================================='), nl.
