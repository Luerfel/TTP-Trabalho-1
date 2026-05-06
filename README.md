# Sistema Acadêmico em Prolog

Projeto desenvolvido para a disciplina **Tópicos em Tecnologia e Programação**, do curso de **Engenharia de Software**, com o objetivo de implementar um sistema acadêmico simples utilizando **Prolog**.

O sistema utiliza uma base de conhecimento com informações sobre cursos, matérias, currículos, alunos e históricos escolares, permitindo realizar consultas sobre a situação acadêmica dos alunos.

## Tecnologias Utilizadas

* Prolog
* SWI-Prolog

## Instalação do SWI-Prolog

### Linux/Ubuntu

```bash
sudo apt update
sudo apt install swi-prolog
```

Para verificar a instalação:

```bash
swipl --version
```

### Windows

Baixe o instalador pelo site oficial do SWI-Prolog:

```text
https://www.swi-prolog.org/Download.html
```

Após instalar, abra o SWI-Prolog pelo menu iniciar ou execute `swipl` no terminal.

## Estrutura do Projeto

```text
sistema_academico.pl
```

O projeto foi consolidado em um único arquivo para facilitar a apresentação e a entrega. Internamente, o arquivo é dividido em seções comentadas:

* **Base de Conhecimento**: fatos do sistema (cursos, matérias, currículos, alunos, matrículas e históricos escolares);
* **Regras**: predicados que respondem às quatro questões pedidas no enunciado (`concluiu`, `falta`, `extra` e `jafoi`), além do predicado base `aprovado`;
* **Predicados Auxiliares**: implementações próprias de `pertence` e `tamanho`, equivalentes ao `member` e ao `length` do Prolog padrão (o enunciado pede o uso apenas de predicados primitivos);
* **Exemplos de Uso**: queries de teste comentadas no final do arquivo.

## Como Executar

No terminal, acesse a pasta do projeto e abra o SWI-Prolog:

```bash
swipl
```

Depois, carregue o arquivo:

```prolog
?- [sistema_academico].
```

## Consultas Disponíveis

O sistema permite as seguintes consultas:

### `concluiu(RA, CC)`

Verifica se o aluno de RA informado concluiu o curso de código indicado.

```prolog
?- concluiu(12909, 1).
false.
```

### `falta(RA, CC, Lista)`

Retorna em `Lista` os nomes das matérias que ainda faltam para o aluno concluir o curso.

```prolog
?- falta(12909, 1, OQUE).
OQUE = [topicos_em_metodologias_de_programacao].
```

### `extra(RA, CC, Lista)`

Retorna em `Lista` os nomes das matérias extracurriculares cursadas pelo aluno (matérias presentes no histórico mas que não fazem parte do currículo do curso informado).

```prolog
?- extra(12808, 1, QUAIS).
QUAIS = [circuitos_eletricos].
```

### `jafoi(CC, RA, Percentual)`

Calcula o percentual do currículo do curso que o aluno já cumpriu, considerando apenas matérias obrigatórias.

```prolog
?- jafoi(1, 12909, QUANTO).
QUANTO = 75.0.
```

### `aprovado(RA, CM)`

Predicado auxiliar que verifica se um aluno foi aprovado em uma determinada matéria. Considera aprovado quem cursou a matéria com nota maior ou igual a 5.0 e frequência maior ou igual a 0.75.

```prolog
?- aprovado(12909, 2).
true.
```

## Autores

* Beatriz Kamien Tehzy  25007147
* Bernado Alberto Amaro 25014832
* Matheus Augusto Mendonça 22011027
