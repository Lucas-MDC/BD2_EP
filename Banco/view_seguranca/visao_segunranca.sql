create view vendas_recentes_intel as
select 
	ov.*,
	(now()::date - ov.data_venda::date) AS dias_distancia
from
	Produto p
inner join Fabricante fab
	on p.fk_fabricante_id_fab = fab.id_fab
inner join 	Operacao_venda ov
	on p.id_produto = ov.fk_produto_id_produto
where 
	nome_fab = 'intel' 
	and 
	--No maximo 90 dias atras
	(now()::date - ov.data_venda::date) < 90
order by
	data_venda desc;