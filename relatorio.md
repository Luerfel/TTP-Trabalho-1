# Relatório de Desenvolvimento - Trabalho 1 em Prolog

## Objetivo
O objetivo do trabalho é desenvolver um programa em Prolog que utilize uma base de conhecimento fornecida sobre o meio acadêmico (cursos, matérias, currículos, alunos e seus históricos).

## Atividades Realizadas

1. **Configuração do Ambiente:** -
   - Instalação e configuração do SWI-Prolog no sistema para a compilação e execução do código. 

2. **Criação da Base de Conhecimento (`conhecimento.pl`):**
   - Transcrição dos dados do problema para fatos na sintaxe do Prolog.
   - Foram mapeadas as seguintes relações:
     - `curso/2`: Relação entre código e nome do curso.
     - `materia/3`: Relação entre código, nome e quantidade de aulas semanais.
     - `curriculo/2`: Lista de matérias pertencentes ao currículo de um curso.
     - `aluno/2`: Relação entre o RA e o nome do aluno.
     - `cursa/2`: Indicação de qual curso um aluno cursa.
     - `historico/2`: Lista de itens (`item/5`) representando a performance do aluno em matérias específicas.
   - Foram feitos ajustes de sintaxe, englobando átomos compostos por mais de uma palavra entre aspas simples (ex: `'técnicas de programacao'`).

## Próximos Passos
- Implementar as regras e cláusulas exigidas pelo professor/trabalho, utilizando a base de conhecimento estruturada.
- Testar e refinar as consultas efetuadas contra o histórico dos alunos.
