
# Sistema Acadêmico em Prolog

Projeto desenvolvido para a disciplina **Tópicos em Tecnologia e Programação**, do curso de **Engenharia de Software**, com o objetivo de implementar um sistema acadêmico simples utilizando **Prolog**.

O sistema trabalha com uma base de conhecimento composta por cursos, matérias, currículos, alunos, cursos frequentados e históricos escolares, permitindo consultar a situação acadêmica de um aluno em relação à conclusão de determinado curso.

## Objetivo do Trabalho

O objetivo principal é criar cláusulas em Prolog capazes de responder consultas acadêmicas, como:

- Verificar se um aluno concluiu determinado curso;
- Listar as matérias obrigatórias que ainda faltam para a conclusão do curso;
- Listar matérias extracurriculares cursadas pelo aluno;
- Calcular o percentual de matérias obrigatórias já concluídas pelo aluno.

O trabalho segue as especificações apresentadas no enunciado da disciplina. 

## Base de Conhecimento

A base de conhecimento utiliza os seguintes predicados principais:

### `curso(CodigoCurso, NomeCurso).`

Representa um curso existente.

Exemplo:

```prolog
curso(1, informatica).
curso(2, eletro_eletronica).
