
## Regra 1

```sql
select * from tem_peca where 
	(fk_produto_id_produto = 16 and fk_produto_id_produto_ = 1)
	
select p.id_produto, tp.nome_tipo from produto p inner join tipo_produto tp on p.fk_tipo_produto_id_tipo = tp.id_tipo where id_produto in (1, 2, 16, 12)
```

```sql
--update sk (errado) não passou
update
	tem_peca
set
	fk_produto_id_produto = 2
where
	fk_produto_id_produto = 16 and fk_produto_id_produto_ = 1

--update sk (correto) passou
update
	tem_peca
set
	fk_produto_id_produto = 16
where
	fk_produto_id_produto = 16 and fk_produto_id_produto_ = 1
	
--update sk_ (errado) não passou
update
	tem_peca
set
	fk_produto_id_produto_ = 16
	
--update sk_ (correto) passou
update
	tem_peca
set
	fk_produto_id_produto_ = 12
where
	fk_produto_id_produto = 16 and fk_produto_id_produto_ = 1
	
--update sk e sk_ iguais (errado) não passou
update
	tem_peca
set
	fk_produto_id_produto  = 16
```

## Regra 2

```sql
--Cria uma seria não padrão
insert into Proc_Serie values
  ('Serie predefinida RYZEN BERSERK');

--Insere um processador para essa série
insert into Processador values
  (3599, 250.0, 5000, 3, 71);

--Insere dois processador sem série, que receberão duas novas séries padrão
insert into Processador values
  (125, 3.3, 4, 1, null)
, (200, 4.2, 8, 2, null);
```