% =========================================================
% Sistema Academico em PROLOG
% 1o Trabalho - Topicos em Tecnologia e Programacao - 2026
% =========================================================
% Membros do Grupo
% Beatriz Kamien Tehzy, RA: 25007147
% Bernardo Alberto Amaro, RA: 25014832
% Matheus Augusto Mendonça, RA: 22011027
% =========================================================


% =========================================================
% ---------------- BASE DE CONHECIMENTO -------------------
% =========================================================
% Aqui ficam os fatos do sistema: cursos, materias,
% curriculos, alunos, matriculas e historico escolar.
% =========================================================


% --- Cursos ---
% curso(Codigo, Nome).
curso(1, informatica).
curso(2, eletro_eletronica).


% --- Materias ---
% materia(Codigo, Nome, AulasPorSemana).
materia(1, tecnicas_de_programacao, 8).
materia(2, programacao_orientada_a_objetos, 5).
materia(3, estruturas_de_dados, 4).
materia(4, topicos_em_metodologias_de_programacao, 3).
materia(5, circuitos_eletricos, 4).
materia(6, eletronica_digital, 5).
materia(7, arquitetura_computadores, 6).
materia(8, microcontroladores, 4).


% --- Curriculos ---
% curriculo(CodigoCurso, [ListaDeMaterias]).
% Diz quais materias fazem parte do curriculo de cada curso.
curriculo(1, [1,2,3,4]).
curriculo(2, [5,6,7,8]).


% --- Alunos ---
% aluno(RA, Nome).
aluno(12808, jose).
aluno(12080, marcos).
aluno(12909, joao).
aluno(12090, ana).


% --- Matriculas ---
% cursa(RA, CodigoCurso). Em qual curso o aluno esta matriculado.
cursa(12909, 1).
cursa(12080, 2).
cursa(12090, 2).


% --- Historico escolar ---
% historico(RA, [Itens]).
% Cada item tem o formato:
%   item(CodigoMateria, Semestre, Ano, Nota, Frequencia)
historico(12808, [item(1,1,2012,3.0,0.77), item(1,2,2013,6.5,0.90), item(5,1,2014,8.0,0.80)]).
historico(12909, [item(1,1,2012,7.0,0.80), item(2,2,2013,8.5,0.80), item(3,1,2014,5.0,0.75)]).
historico(12080, [item(5,1,2012,6.0,0.70), item(5,2,2013,7.5,0.90), item(6,1,2014,5.0,0.90)]).
historico(12090, [item(7,1,2012,6.0,0.75), item(8,2,2014,8.0,0.89)]).



% =========================================================
% --------------------- REGRAS ----------------------------
% =========================================================
% Aqui estao os predicados que respondem as 4 perguntas
% pedidas no enunciado, mais um predicado base (aprovado)
% que eh usado por quase todos os outros.
% =========================================================


% ---------------------------------------------------------
% aprovado(RA, CM)
% ---------------------------------------------------------
% Verifica se o aluno RA foi aprovado na materia CM.
% Pra estar aprovado, o aluno precisa ter cursado a materia
% pelo menos uma vez com nota >= 5.0 e frequencia >= 0.75.
% A ideia: pega o historico e percorre item por item ate
% achar um que satisfaca essas condicoes.

aprovado(RA, CM):-
    historico(RA, Hist),
    aprovado_historico(CM, Hist).

% Se o item da cabeca da lista e da materia que a gente quer
% e tem nota e frequencia suficientes, deu certo.
aprovado_historico(CM, [item(CM, _SM, _AN, NT, FQ)|_]):-
    NT >= 5.0,
    FQ >= 0.75.

% Senao, segue procurando no resto da lista.
aprovado_historico(CM, [_|R]):-
    aprovado_historico(CM, R).


% ---------------------------------------------------------
% concluiu(RA, CC)         (questao 1 do enunciado)
% ---------------------------------------------------------
% Diz se o aluno RA ja concluiu o curso CC, isto e, se ele
% foi aprovado em TODAS as materias do curriculo do curso.
% Ex: concluiu(12909, 1).  ->  false

concluiu(RA, CC):-
    curriculo(CC, Materias),
    todas_aprovadas(RA, Materias).

% Caso base: lista de materias vazia -> tudo certo.
todas_aprovadas(_, []).

% Caso recursivo: precisa estar aprovado nessa materia E
% em todas as outras da lista.
todas_aprovadas(RA, [CM|R]):-
    aprovado(RA, CM),
    todas_aprovadas(RA, R).


% ---------------------------------------------------------
% falta(RA, CC, Lista)     (questao 2 do enunciado)
% ---------------------------------------------------------
% Retorna em Lista os nomes das materias que ainda faltam
% pro aluno RA concluir o curso CC.
% Ex: falta(12909, 1, OQUE).
%      OQUE = [topicos_em_metodologias_de_programacao]

falta(RA, CC, Lista):-
    curriculo(CC, Materias),
    faltam(RA, Materias, Lista).

% Caso base: nao tem mais materia pra checar.
faltam(_, [], []).

% Se ja foi aprovado nessa materia, ela nao entra na lista
% (continua o processamento sem incluir nada).
faltam(RA, [CM|R], Lista):-
    aprovado(RA, CM),
    faltam(RA, R, Lista).

% Se nao foi aprovado, busca o nome da materia e adiciona
% na lista de resultado.
faltam(RA, [CM|R], [NM|Lista]):-
    not(aprovado(RA, CM)),
    materia(CM, NM, _AM),
    faltam(RA, R, Lista).


% ---------------------------------------------------------
% extra(RA, CC, Lista)     (questao 3 do enunciado)
% ---------------------------------------------------------
% Retorna em Lista os nomes das materias extra-curriculares
% que o aluno RA cursou, ou seja, materias que aparecem no
% historico dele mas que NAO fazem parte do curriculo do
% curso CC.
% Ex: extra(12808, 1, QUAIS).  ->  QUAIS = [circuitos_eletricos]

extra(RA, CC, Lista):-
    historico(RA, Hist),
    curriculo(CC, Materias),
    extras(Hist, Materias, Lista).

% Caso base: terminou de percorrer o historico.
extras([], _, []).

% Se a materia do item ta no curriculo, nao e extra -> ignora
% e segue pro proximo.
extras([item(CM, _SM, _AN, _NT, _FQ)|R], Materias, Lista):-
    pertence(CM, Materias),
    extras(R, Materias, Lista).

% Se nao ta no curriculo, e extra -> pega o nome e poe na lista.
extras([item(CM, _SM, _AN, _NT, _FQ)|R], Materias, [NM|Lista]):-
    not(pertence(CM, Materias)),
    materia(CM, NM, _AM),
    extras(R, Materias, Lista).


% ---------------------------------------------------------
% jafoi(CC, RA, Percentual)    (questao 4 do enunciado)
% ---------------------------------------------------------
% Calcula a porcentagem das materias do curriculo do curso
% CC que o aluno RA ja cumpriu. Materias extras nao entram
% na conta (so as obrigatorias).
% Ex: jafoi(1, 12909, QUANTO).  ->  QUANTO = 75.0

jafoi(CC, RA, Percentual):-
    curriculo(CC, Materias),
    tamanho(Materias, Total),
    total_aprovadas(RA, Materias, Cumpridas),
    Percentual is (Cumpridas / Total) * 100.0.

% Conta quantas materias da lista o aluno foi aprovado.
total_aprovadas(_, [], 0).

% Foi aprovado nessa -> soma 1 no que vier do resto.
total_aprovadas(RA, [CM|R], Total):-
    aprovado(RA, CM),
    total_aprovadas(RA, R, Parcial),
    Total is Parcial + 1.

% Nao foi aprovado -> o total e igual ao do resto.
total_aprovadas(RA, [CM|R], Total):-
    not(aprovado(RA, CM)),
    total_aprovadas(RA, R, Total).



% =========================================================
% --------------- PREDICADOS AUXILIARES -------------------
% =========================================================
% Reimplementamos na mao o que normalmente seria o 
% member e o length.
% =========================================================


% --- pertence(X, Lista) ---
% Verdadeiro se X esta na lista. Equivalente ao member.

pertence(X, [X|_]).

pertence(X, [_|R]):-
    pertence(X, R).


% --- tamanho(Lista, T) ---
% Calcula quantos elementos tem na lista. Equivalente ao length.

tamanho([], 0).

tamanho([_|R], T):-
    tamanho(R, TR),
    T is TR + 1.



% =========================================================
% ----------------- EXEMPLOS DE USO -----------------------
% =========================================================
% Pra testar no interpretador, podemos rodar as queries
% abaixo
% 
%
%   ?- concluiu(12909, 1).
%      false.
%
%   ?- falta(12909, 1, OQUE).
%      OQUE = [topicos_em_metodologias_de_programacao].
%
%   ?- extra(12808, 1, QUAIS).
%      QUAIS = [circuitos_eletricos].
%
%   ?- jafoi(1, 12909, QUANTO).
%      QUANTO = 75.0.
%
%   ?- aprovado(12909, 2).
%      true.
%
% =========================================================
