select
	p.nome_produto,
	tp.nome_tipo,
	count(*) num
from
	operacao_venda ov
inner join produto p
	on ov.fk_produto_id_produto = p.id_produto
inner join tipo_produto tp
	on p.fk_tipo_produto_id_tipo = tp.id_tipo
where
	tp.nome_tipo in ('processador', 'placa de video', 'memoria primaria', 'memoria secundaria', 'placa mae')
group by
	p.nome_produto, tp.nome_tipo
order by
	num desc
limit 5;