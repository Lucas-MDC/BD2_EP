select 
	p.id_produto,
	p.nome_produto "Nome",
	p.descri "Descrição",
	p.modelo "Modelo",
	p.link_foto,
	p.preco_produto || ' R$' "Preço" ,
	substring(cast(p.data_dev as varchar), 0, 11) as "Data de desenvolvimento",
	dev.nome_dev "Desenvolvedora",
	fab.nome_fab "Fabricante",
	max_tdp_cpu || 'W' "TDP máximo da CPU",
	temperatura_cpu || '°C' "Temperatura máxima da CPU",
	largura || 'cm' "Largura",
	comprimento || 'cm' "Comprimento",
	altura || 'cm' "Altura",
	tamanho_bios || 'mb' "Tamanho da bios"
from 
	Produto p
inner join Placa_mae pm
	on p.id_produto = pm.fk_produto_id_produto
inner join Desenvolvedor dev
	on p.fk_desenvolvedor_id_dev = dev.id_dev
inner join Fabricante fab
	on p.fk_fabricante_id_fab = fab.id_fab