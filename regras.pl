:- [conhecimento].

aprovado(RA, CM):-
    historico(RA, Hist),
    aprovado_historico(CM, Hist).

aprovado_historico(CM, [item(CM, _SM, _AN, NT, FQ)|_]):-
    NT >= 5.0,
    FQ >= 0.75.

aprovado_historico(CM, [_|R]):-
    aprovado_historico(CM, R).

concluiu(RA, CC):-
    curriculo(CC, Materias),
    todas_aprovadas(RA, Materias).

todas_aprovadas(_, []).

todas_aprovadas(RA, [CM|R]):-
    aprovado(RA, CM),
    todas_aprovadas(RA, R).

falta(RA, CC, Lista):-
    curriculo(CC, Materias),
    faltam(RA, Materias, Lista).

faltam(_, [], []).

faltam(RA, [CM|R], Lista):-
    aprovado(RA, CM),
    faltam(RA, R, Lista).

faltam(RA, [CM|R], [NM|Lista]):-
    not(aprovado(RA, CM)),
    materia(CM, NM, _AM),
    faltam(RA, R, Lista).

extra(RA, CC, Lista):-
    historico(RA, Hist),
    curriculo(CC, Materias),
    extras(Hist, Materias, Lista).

extras([], _, []).

extras([item(CM, _SM, _AN, _NT, _FQ)|R], Materias, Lista):-
    pertence(CM, Materias),
    extras(R, Materias, Lista).

extras([item(CM, _SM, _AN, _NT, _FQ)|R], Materias, [NM|Lista]):-
    not(pertence(CM, Materias)),
    materia(CM, NM, _AM),
    extras(R, Materias, Lista).

jafoi(CC, RA, Percentual):-
    curriculo(CC, Materias),
    tamanho(Materias, Total),
    total_aprovadas(RA, Materias, Cumpridas),
    Percentual is (Cumpridas / Total) * 100.0.

total_aprovadas(_, [], 0).

total_aprovadas(RA, [CM|R], Total):-
    aprovado(RA, CM),
    total_aprovadas(RA, R, Parcial),
    Total is Parcial + 1.

total_aprovadas(RA, [CM|R], Total):-
    not(aprovado(RA, CM)),
    total_aprovadas(RA, R, Total).

pertence(X, [X|_]).

pertence(X, [_|R]):-
    pertence(X, R).

tamanho([], 0).

tamanho([_|R], T):-
    tamanho(R, TR),
    T is TR + 1.

% Regra principal item 2
falta(RA, CC, ListaFaltantes) :-
    curriculo(CC, Materias),
    extrai_faltantes(RA, Materias, ListaFaltantes).

extrai_faltantes(_, [], []).

% Caso 1: O aluno já está aprovado
extrai_faltantes(RA, [CM|R], ListaFaltantes) :-
    aprovado(RA, CM),
    extrai_faltantes(RA, R, ListaFaltantes).

% Caso 2: O aluno não está aprovado
extrai_faltantes(RA, [CM|R], [NM|ListaFaltantes]) :-
    not(aprovado(RA, CM)),
    materia(CM, NM, _AM),
    extrai_faltantes(RA, R, ListaFaltantes).

% Regra principal do item 3
extra(RA, CC, Lista):-
    historico(RA, Hist),
    curriculo(CC, Materias),
    extras(Hist, Materias, Lista).

extras([], _, []).

extras([item(CM, _SM, _AN, _NT, _FQ)|R], Materias, Lista):-
    pertence(CM, Materias),
    extras(R, Materias, Lista).

extras([item(CM, _SM, _AN, _NT, _FQ)|R], Materias, [NM|Lista]):-
    not(pertence(CM, Materias)),
    materia(CM, NM, _AM),
    extras(R, Materias, Lista).
