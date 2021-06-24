with recursive rand_venda as
(
	--Caso base
	select
		1 as i,
		floor(random() * (-prod.num+1) + prod.num) fk_prod,
		floor(random() * (-vend.num+1) + vend.num) fk_vendendor, 
		floor(random() * (-cli.num+1) + cli.num) fk_cliente, 
		base.quant
	from
	(
		select floor(random() * (1-10+1) + 10) quant
	) base
	inner join (select count(id_produto) num from produto ) prod
		on 1=1
	inner join (select count(id_vendedor) num from vendedor) vend
		on 1=1
	inner join (select count(id_cliente) num from cliente) cli
		on 1=1
	
	union
	
	--Recursao
	select
		rand_venda.i + 1,
		floor(random() * (-prod.num+1) + prod.num) fk_prod,
		floor(random() * (-vend.num+1) + vend.num) fk_vendendor, 
		floor(random() * (-cli.num+1) + cli.num) fk_cliente,
		r.quant
	from
	(
		select floor(random() * (1-10+1) + 10) quant
	) r
	inner join (select count(id_produto) num from produto) prod
		on 1=1
	inner join (select count(id_vendedor) num from vendedor) vend
		on 1=1
	inner join (select count(id_cliente) num from cliente) cli
		on 1=1
	inner join rand_venda on rand_venda.i < 100 --Quantidade de linhas a serem geradas
)
select
	p.preco_produto * rand_venda.quant valor_venda,
	rand_venda.quant quantidade,
	cast(cast(floor(random() * (2020-2021+1) + 2021) as varchar) || '-' || cast(floor(random() * (1-7+1) + 7) as varchar) || '-' || cast(floor(random() * (1-23+1) + 23) as varchar) as date) data_venda,
	rand_venda.fk_prod,
	rand_venda.fk_vendendor,
	rand_venda.fk_cliente
from
	rand_venda
inner join produto p
	on rand_venda.fk_prod = p.id_produto

-- Insere --
with recursive rand_venda as
(
		--Caso base
	select
		1 as i,
		floor(random() * (-prod.num+1) + prod.num) fk_prod,
		floor(random() * (-vend.num+1) + vend.num) fk_vendendor, 
		floor(random() * (-cli.num+1) + cli.num) fk_cliente, 
		base.quant
	from
	(
		select floor(random() * (1-10+1) + 10) quant
	) base
	inner join (select count(id_produto) num from produto ) prod
		on 1=1
	inner join (select count(id_vendedor) num from vendedor) vend
		on 1=1
	inner join (select count(id_cliente) num from cliente) cli
		on 1=1
	
	union
	
	--Recursao
	select
		rand_venda.i + 1,
		floor(random() * (-prod.num+1) + prod.num) fk_prod,
		floor(random() * (-vend.num+1) + vend.num) fk_vendendor, 
		floor(random() * (-cli.num+1) + cli.num) fk_cliente,
		r.quant
	from
	(
		select floor(random() * (1-10+1) + 10) quant
	) r
	inner join (select count(id_produto) num from produto) prod
		on 1=1
	inner join (select count(id_vendedor) num from vendedor) vend
		on 1=1
	inner join (select count(id_cliente) num from cliente) cli
		on 1=1
	inner join rand_venda on rand_venda.i < 100 --Quantidade de linhas a serem geradas
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
	cast(cast(floor(random() * (2020-2021+1) + 2021) as varchar) || '-' || cast(floor(random() * (1-7+1) + 7) as varchar) || '-' || cast(floor(random() * (1-23+1) + 23) as varchar) as date) data_venda,
	rand_venda.fk_prod,
	rand_venda.fk_vendendor,
	rand_venda.fk_cliente
from
	rand_venda
inner join produto p
	on rand_venda.fk_prod = p.id_produto