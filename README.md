# BD2_EP

## Parte 1

### ARTEFATOS A SEREM ENTREGUES:

*a)* (artefato do tipo texto) O grupo deve escolher um contexto no qual seja possível desenvolvimento de
um sistema de banco de dados. Este contexto deverá ser especificado textualmente, de forma concisa,
com a finalidade de documentar os principais requisitos do sistema. É esperado um texto com cerca de
5 parágrafos (com cerca de 8 linhas em cada parágrafo) usando fonte Calibri, tamanho 10 (como neste
documento, inclusive com este tipo de margem (Superior e Inferior: 2,5 cm / Esquerda e Direita: 3,0 cm)
e espaçamento de 1,15 entre linhas). Este artefato deve ser entregue na plataforma em uso pelo
professor da sua turma (e-Disciplinas ou taqui) em formato PDF.

Obs. 1: descrições textuais mais detalhadas serão solicitadas quando necessário, dentro das
especificações das diferentes partes do trabalho.

Obs. 2: o contexto pode ser o mesmo usado na disciplina de Banco de Dados, inclusive os alunos podem
"aproveitar" os artefatos de softwares já desenvolvidos, apenas adequando-os para contemplar as
exigências especificadas para este trabalho.

*b)* (artefato do tipo diagrama) apresentar um Modelo Entidade-Relacionamento (conjuntos-entidade,
conjuntos-relacionamento, atributos, chaves primárias), contendo no mínimo 10 conjuntos-entidade
fortes, 1 conjunto-entidade fraca, 1 relacionamento de generalização-especialização. Este modelo
deverá ser implementado em uma ferramenta CASE que suporte este tipo de modelo. Recomenda-se
fortemente a escolha de uma ferramenta CASE capaz de mapear o modelo Entidade-Relacionamento
para o modelo relacional. Este artefato deve ser entregue na plataforma em uso pelo professor da
disciplina (e-Disciplinas ou taqui) no formato PDF. Não serão aceitos arquivos em formato
proprietário da ferramenta CASE usada.

Obs. 1: situações especiais no modelo (que causem algum tipo de dúvida, questionamento ou
"estranheza") devem ser comentadas no próprio diagrama.

Obs. 2: se necessário, o grupo deve estender o seu contexto até que o modelo atinja as especificações
mínimas.

*c)* (artefato do tipo diagrama) apresentar o modelo Relacional derivado no modelo EntidadeRelacionamento (relações, atributos, chaves primárias e chaves estrangeiras). Este modelo deverá ser
implementado em ferramenta CASE. Este artefato deve ser entregue no e-Disciplinas ou taqui
(formato PDF). Não serão aceitos arquivos em formato proprietário da ferramenta CASE usada.

Obs.: o MODELO RELACIONAL é o Modelo-Entidade Relacionamento APÓS o mapeamento de entidades
para tabelas. Consulte as aulas de revisão.

*d)* (artefato do tipo texto e código) apresentar 4 consultas em SQL implementadas para seu sistema.
Essas consultas devem ser as mais complexas que o grupo projetou para o sistema e devem considerar
apenas o uso de instruções SQL (a linguagem de programação do SGBD não deve ser considerada na
resolução destas consultas). Pelo menos duas dessas consultas devem considerar funções de grupo.
Este artefato deve ser entregue no e-Disciplinas ou taqui -- consultas em SQL em arquivo ASCII (.txt)
prontas para serem testadas no SGBD.

Obs. 1 -- Para cada uma das consultas, apresente: a especificação textual da consulta; a resolução da
consulta em SQL implementada no sistema (e testada, sua consulta deve "funcionar corretamente"); a
especificação da consulta em álgebra relacional, sempre que isso for possível (nem todas as instruções
de SQL existem em álgebra relacional e muitas vezes não podem ser obtidas pela combinação de
instruções existente em álgebra).

Obs. 2: A complexidade das consultas será determinante para execução de outras partes do trabalho.
Assim, a depender das consultas projetadas, pode ser possível ter que elaborar novas consultas. Por isso,
é interessante o grupo já analisar as demais partes do trabalho, a seguir.

### Ordem de população das tabelas

1. Desenvolvedor
2. Fabricante
3. Tipo produto
4. Vendedor
5. Cliente
6. Interface
7. Produto
8. Placa mae
9. Memoria primaria
10. Memoria secundaria
11. Processador
12. Proc serie
13. Placa de video
14. Video serie
15. Tem interface
16. Tem peça
17. Operação venda
