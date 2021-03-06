with maquina as
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
)
select 
	maquina.nome_produto maquina,
	maquina.preco_produto preco_maquina,
	sum(p.preco_produto * maquina.qtd_peca) soma_preco_pecas
from
	maquina
inner join produto p 
	on maquina.fk_produto_id_produto_ = p.id_produto
inner join tipo_produto tprod
	on p.fk_tipo_produto_id_tipo = tprod.id_tipo
group by
	maquina.nome_produto, maquina.preco_produto
order by
	sum(p.preco_produto * maquina.qtd_peca) desc