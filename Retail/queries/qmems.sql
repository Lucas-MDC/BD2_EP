select 
	p.id_produto,
	p.nome_produto "Nome",
	p.descri "Descrição",
	p.modelo "Modelo",
	p.link_foto,
	p.preco_produto || ' R$' "Preço",
	substring(cast(p.data_dev as varchar), 0, 11) as "Data de desenvolvimento",
	dev.nome_dev "Desenvolvedora",
	fab.nome_fab "Fabricante",
	tamanho_mem_sec || 'Gb' "Tamanho",
	leitura_mem_sec || 'MHz' "Frequência de leitura",
	escritura_mem_sec || 'MHz' "Frequência de escrita"
from 
	Produto p
inner join Memoria_secundaria ms
	on p.id_produto = ms.fk_produto_id_produto
inner join Desenvolvedor dev
	on p.fk_desenvolvedor_id_dev = dev.id_dev
inner join Fabricante fab
	on p.fk_fabricante_id_fab = fab.id_fab