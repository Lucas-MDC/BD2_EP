--1
select
	p.nome_produto,
	tp.nome_tipo,
	count(*)
from
	operacao_venda ov
inner join produto p
	on ov.fk_produto_id_produto = p.id_produto
inner join tipo_produto tp
	on p.fk_tipo_produto_id_tipo = tp.id_tipo
where
	tp.nome_tipo <> 'maquina'
group by
	p.id_produto, tp.nome_tipo
order by
	num desc

--2 NO EXCISTE

--3
select 
	maquina.nome_produto,
	maquina.preco_produto,
	sum(p.preco_produto * maquina.qtd_peca)
from
(
    select 
		p.nome_produto,
		p.id_produto,
		p.preco_produto,
		p.fk_tipo_produto_id_tipo,
		tp.fk_produto_id_produto_,
		tp.qtd_peca
	from
		Tem_Peca tp 
	inner join
		produto p
	on
		tp.fk_produto_id_produto = p.id_produto
) maquina
inner join produto p 
	on maquina.fk_produto_id_produto_ = p.id_produto
inner join tipo_produto tprod
	on p.fk_tipo_produto_id_tipo = tprod.id_tipo
group by
	maquina.nome_produto, maquina.preco_produto
order by
	sum(p.preco_produto * maquina.qtd_peca) desc

--4
select
	p.nome_produto,
	count(p.nome_produto)
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
