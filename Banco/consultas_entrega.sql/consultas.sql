/*
1. Selecione o nome, tipo e quantidade de vendas dos cinco produtos avulsos (que não são maquinas) mais vendidos.
*/
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
	tp.nome_tipo != 'maquina'
group by
	p.id_produto, tp.nome_tipo
order by
	num desc
limit 5;

/*
2. Selecione o nome, o nome de suas fabricantes, e as frequencias das placas de video cuja frequencia seja maior que a media das frequencias de todas as placas de video. (não há formula de algebra relacional para essa query).
*/
with media as
(
	select distinct
		f.nome_fab,
		p.nome_produto,
		pv.freq_placa_video,
		avg(pv.freq_placa_video) over(partition by fk_tipo_produto_id_tipo) media_freq
	from
		placa_video pv
	inner join Produto p
		on pv.fk_produto_id_produto = p.id_produto
	inner join fabricante f
		on p.fk_fabricante_id_fab = f.id_fab
)
select
	*
from
	media
where
	freq_placa_video >= media_freq

/*
3. Selecione o nome das maquinas, seus preços e a soma dos preços de suas peças.
*/
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
	sum(p.preco_produto * maquina.qtd_peca) desc;

/*
4. Selecione o nome das placas mães e a quantidade de peças compatíveis com elas, ordenadas de forma decrescente.
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
	count(p.nome_produto) desc;

/*
Bonus 1. Liste todos os processadores para os quais há pelo menos uma venda, junto com seu nome, nome de seu desenvolvedor, número de cores, média de número de cores de todos os processadores do seu desenvolvedor e o seu aumento ou diminuição relativa do seu número de cores em relação a média mencionada. 
(não há formula de algebra relacional para essa query)
*/
with produtos_proc as
(
	select
		p.nome_produto,
		tp.fk_produto_id_produto id_produto,
		p.id_produto fk_proc,
		p.fk_Desenvolvedor_id_dev
	from
		Tem_Peca tp 
	inner join
		produto p
	on
		tp.fk_produto_id_produto_ = p.id_produto
	inner join tipo_produto tprod
		on p.fk_tipo_produto_id_tipo = tprod.id_tipo
	where
		tprod.nome_tipo = 'processador'

	union 

	select
		p.nome_produto,
		p.id_produto,
		p.id_produto fk_proc,
		p.fk_Desenvolvedor_id_dev
	from
		produto p
	inner join tipo_produto tprod
		on p.fk_tipo_produto_id_tipo = tprod.id_tipo
	where
		tprod.nome_tipo = 'processador'
),
proc_vendidos as
(
	select distinct
		produtos_proc.nome_produto nome_proc,
		proc.cores_proc,
		dev.nome_dev
	from
		processador proc
	inner join produtos_proc
		on produtos_proc.fk_proc = proc.fk_produto_id_produto
	inner join desenvolvedor dev
		on produtos_proc.fk_Desenvolvedor_id_dev = dev.id_dev
	inner join operacao_venda ov
		on produtos_proc.id_produto = ov.fk_Produto_id_produto
),
medias_proc as
(
	select distinct
		proc_vendidos. nome_proc,
		proc_vendidos.cores_proc,
		avg(proc_vendidos.cores_proc) over(partition by proc_vendidos.nome_dev) media_cores_proc_dev,
		proc_vendidos.nome_dev
	from
		proc_vendidos
)
select
	medias_proc.nome_proc,
	medias_proc.nome_dev,
	medias_proc.cores_proc,
	medias_proc.media_cores_proc_dev,
	cast(trunc(medias_proc.cores_proc/medias_proc.media_cores_proc_dev - 1, 2)*100 as varchar) || '%' acima_media_cores
from
	medias_proc
order by
	medias_proc.cores_proc/medias_proc.media_cores_proc_dev desc;

/*
Bonus 2. Gere 10 vendas aleatorias para a tabela operacao_venda, utilizando os produtos, vendedores e clientes existentes e que tenham as datas a partir do ano de 2020.
(não há formula de algebra relacional para essa query).
*/
with recursive rand_venda as
(
	--Inicial
	select
		1 as i,
		floor(random() * (1-prod.num+1) + prod.num) fk_prod,
		floor(random() * (1-vend.num+1) + vend.num) fk_vendendor, 
		floor(random() * (1-cli.num+1) + cli.num) fk_cliente, 
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
		floor(random() * (1-prod.num+1) + prod.num) fk_prod,
		floor(random() * (1-vend.num+1) + vend.num) fk_vendendor, 
		floor(random() * (1-cli.num+1) + cli.num) fk_cliente,
		r.quant
	from
	(
		select floor(random() * (1-10+1) + 10) quant
	) r
	inner join (select count(id_produto) num from produto ) prod
		on 1=1
	inner join (select count(id_vendedor) num from vendedor) vend
		on 1=1
	inner join (select count(id_cliente) num from cliente) cli
		on 1=1
	inner join rand_venda on rand_venda.i < 10 --Quantidade de linhas a serem geradas
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
	on rand_venda.fk_prod = p.id_produto;