/*
1. Selecione o nome das maquinas e de suas peças e suas respectivas quantidades, ordenando pelo nome das maquinas e depois pelo tipo de cada peça.
*/
with maquina as
(
	select 
		p.nome_produto,
		p.id_produto,
		p.fk_tipo_produto_id_tipo,
		tp.fk_produto_id_produto_,
		tp.qtd_peca
	from
		Tem_Peca tp 
	inner join
		produto p
	on
		tp.fk_produto_id_produto = p.id_produto
)
select 
	maquina.nome_produto,
	p.nome_produto,
	tprod.nome_tipo,
	maquina.qtd_peca
from
	maquina
inner join produto p 
	on maquina.fk_produto_id_produto_ = p.id_produto
inner join tipo_produto tprod
	on p.fk_tipo_produto_id_tipo = tprod.id_tipo
order by
	maquina.nome_produto, tprod.nome_tipo desc;

/*
2. Selecione o nome das placas mães e a quantidade de peças compatíveis com elas, ordenadas de forma decrescente.
*/
select
	p.nome_produto placa_mae,
	count(p.nome_produto) quantidade_pecas_compativeis
from
	produto p
inner join tipo_produto tprod
	on p.fk_tipo_produto_id_tipo = tprod.id_tipo
inner join tem_interface tint
	on p.id_produto = tint.fk_produto_id_produto
inner join 
(
	select
		p.id_produto,
		tint.fk_interface_id_interface
	from
		produto p
	inner join tipo_produto tprod
		on p.fk_tipo_produto_id_tipo = tprod.id_tipo
	inner join tem_interface tint
		on p.id_produto = tint.fk_produto_id_produto
	where
		tprod.nome_tipo not in ('placa mae', 'maquina')	
) pecas
	on tint.fk_interface_id_interface = pecas.fk_interface_id_interface
where
	tprod.nome_tipo = 'placa mae'
group by
	p.nome_produto
order by
	count(p.nome_produto) desc