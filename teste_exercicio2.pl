% Bernardo Alberto Amaro - 25014832

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

testes_falta :-
    write('=== TESTES DO OBJETIVO 2 (FALTA) ==='), nl,
    
    % Teste 1: O exemplo exato cobrado no enunciado do projeto
    testa_lista(
        'Teste do Enunciado: falta(12909, 1, OQUE)',
        falta(12909, 1, OQUE),
        OQUE,
        [topicos_em_metodologias_de_programacao]
    ),

% Executando os testes

rodar :-
    nl,
    write('=============================================='), nl,
    write('INICIANDO TESTES DO EXERCICIO 2'), nl,
    write('=============================================='), nl, nl,
    testes_falta, nl,
    write('=============================================='), nl,
    write('FIM DOS TESTES'), nl,
    write('=============================================='), nl.
