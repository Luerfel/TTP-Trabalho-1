% =========================================================
% Testes - Exercicio 1 - Sistema Academico em PROLOG
% =========================================================

:- [regras].

% ---------------------------------------------------------
% Predicados auxiliares para exibir resultado dos testes
% ---------------------------------------------------------

ok(Descricao):-
    write('[OK] '),
    write(Descricao),
    nl.

erro(Descricao):-
    write('[ERRO] '),
    write(Descricao),
    nl.

testa_verdade(Descricao, Consulta):-
    call(Consulta),
    ok(Descricao).

testa_verdade(Descricao, Consulta):-
    not(call(Consulta)),
    erro(Descricao).

testa_falso(Descricao, Consulta):-
    call(Consulta),
    erro(Descricao).

testa_falso(Descricao, Consulta):-
    not(call(Consulta)),
    ok(Descricao).

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

testa_numero(Descricao, Consulta, Obtido, Esperado):-
    call(Consulta),
    Obtido =:= Esperado,
    ok(Descricao).

testa_numero(Descricao, Consulta, Obtido, Esperado):-
    call(Consulta),
    Obtido =\= Esperado,
    erro(Descricao),
    write('  Esperado: '),
    write(Esperado),
    nl,
    write('  Obtido:   '),
    write(Obtido),
    nl.

testa_numero(Descricao, Consulta, _Obtido, _Esperado):-
    not(call(Consulta)),
    erro(Descricao),
    write('  A consulta falhou.'),
    nl.


% ---------------------------------------------------------
% Testes baseados nos exemplos do enunciado do professor
% ---------------------------------------------------------

testes_enunciado:-
    write('=== TESTES DO ENUNCIADO ==='),
    nl,

    testa_falso(
        'concluiu(12909, 1) deve falhar',
        concluiu(12909, 1)
    ),

    testa_lista(
        'falta(12909, 1, OQUE) deve retornar a materia faltante',
        falta(12909, 1, OQUE),
        OQUE,
        [topicos_em_metodologias_de_programacao]
    ),

    testa_lista(
        'extra(12808, 1, QUAIS) deve retornar a materia extra',
        extra(12808, 1, QUAIS),
        QUAIS,
        [circuitos_eletricos]
    ),

    testa_numero(
        'jafoi(1, 12909, QUANTO) deve retornar 75.0',
        jafoi(1, 12909, QUANTO),
        QUANTO,
        75.0
    ).


% ---------------------------------------------------------
% Testes de consistencia geral
% ---------------------------------------------------------

testa_concluiu_falta:-
    forall(
        cursa(RA, CC),
        (
            falta(RA, CC, Lista),
            (
                Lista == [],
                concluiu(RA, CC)
                ;
                Lista \== [],
                not(concluiu(RA, CC))
            )
        )
    ).

testa_percentual_valido:-
    forall(
        curriculo(CC, _Materias),
        forall(
            aluno(RA, _Nome),
            (
                jafoi(CC, RA, Percentual),
                Percentual >= 0.0,
                Percentual =< 100.0
            )
        )
    ).

testa_concluido_percentual_100:-
    forall(
        cursa(RA, CC),
        (
            concluiu(RA, CC),
            jafoi(CC, RA, Percentual),
            Percentual =:= 100.0
            ;
            not(concluiu(RA, CC))
        )
    ).

testes_consistencia:-
    write('=== TESTES DE CONSISTENCIA ==='),
    nl,

    testa_verdade(
        'Quem concluiu deve ter lista de faltantes vazia, e quem nao concluiu nao deve ter lista vazia',
        testa_concluiu_falta
    ),

    testa_verdade(
        'Todos os percentuais devem estar entre 0.0 e 100.0',
        testa_percentual_valido
    ),

    testa_verdade(
        'Todo aluno concluinte deve ter percentual igual a 100.0',
        testa_concluido_percentual_100
    ).


% ---------------------------------------------------------
% Executa todos os testes
% ---------------------------------------------------------

rodar:-
    nl,
    write('=============================================='),
    nl,
    write('INICIANDO TESTES DO EXERCICIO 1'),
    nl,
    write('=============================================='),
    nl,
    nl,
    testes_enunciado,
    nl,
    testes_consistencia,
    nl,
    write('=============================================='),
    nl,
    write('FIM DOS TESTES'),
    nl,
    write('=============================================='),
    nl.