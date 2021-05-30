with rand_venda as
(
	select
		floor(random() * (1-18+1) + 18) fk_prod,
		floor(random() * (1-7+1) + 7) fk_vendendor, 
		floor(random() * (1-9+1) + 8) fk_cliente, 
		floor(random() * (1-10+1) + 10) quant
)
insert into operacao_venda 
(
	valor_venda,
	quantidade,
	data_venda,
	fk_Produto_id_produto,
	fk_Vendedor_id_vendedor,
	fk_Cliente_id_cliente
)
select
	p.preco_produto * rand_venda.quant valor_venda,
	rand_venda.quant quantidade,
	cast(cast(floor(random() * (2020-2030+1) + 2030) as varchar) || '-' || cast(floor(random() * (1-12+1) + 12) as varchar) || '-' || cast(floor(random() * (1-28+1) + 28) as varchar) as date) data_venda,
	rand_venda.fk_prod,
	rand_venda.fk_vendendor,
	rand_venda.fk_cliente
from
	rand_venda
inner join produto p
	on rand_venda.fk_prod = p.id_produto

-- https://en.wikipedia.org/wiki/SQL:1999
	