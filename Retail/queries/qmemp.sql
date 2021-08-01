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
	freq_mem_prim || 'MHz' "Frequência",
	tamanho_mem_prim || 'Gb' "Tamanho",
	leitura_mem_prim || 'MHz' "Frequência de leitura",
	escrita_mem_prim || 'MHz' "Frequência de escrita"
from 
	Produto p
inner join Memoria_primaria mp
	on p.id_produto = mp.fk_produto_id_produto
inner join Desenvolvedor dev
	on p.fk_desenvolvedor_id_dev = dev.id_dev
inner join Fabricante fab
	on p.fk_fabricante_id_fab = fab.id_fab