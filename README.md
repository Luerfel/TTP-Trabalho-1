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
conhecimento.pl
regras.pl
teste_exercicio1.pl
```

### `conhecimento.pl`

Contém a base de conhecimento do sistema, isto é, os fatos utilizados pelo programa.

Exemplos de informações armazenadas:

* cursos;
* matérias;
* currículos;
* alunos;
* vínculo entre aluno e curso;
* histórico escolar dos alunos.

### `regras.pl`

Contém as regras em Prolog responsáveis por realizar as consultas acadêmicas a partir da base de conhecimento.

Esse arquivo carrega automaticamente o `conhecimento.pl`.

### `teste_exercicio1.pl`

Contém testes automáticos para verificar se as regras principais estão funcionando corretamente.

## Como Executar

No terminal, acesse a pasta do projeto e abra o SWI-Prolog:

```bash
swipl
```

Depois, carregue o arquivo principal:

```prolog
?- [regras].
```

Para executar os testes:

```prolog
?- [teste_exercicio1].
?- rodar.
```

## Consultas Gerais

O sistema permite consultar, de forma geral:

* se um aluno concluiu determinado curso;
* quais matérias ainda faltam para concluir o curso;
* quais matérias extracurriculares foram cursadas;
* qual percentual do curso já foi cumprido.

## Organização

O projeto foi separado em arquivos para facilitar a manutenção e a apresentação:

* `conhecimento.pl`: fatos do sistema;
* `regras.pl`: regras lógicas;
* `teste_exercicio1.pl`: testes de funcionamento.

## Autores

* Matheus Augusto Mendonça 22011027
* Beatriz Kamien Tehzy  25007147
* Bernado
