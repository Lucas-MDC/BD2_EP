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
	tdp_proc || 'W' "TDP",
	tdp_proc || '0MHz' "Frequência",
	cores_proc "Nucleos"
from 
	Produto p
inner join Processador proc
	on p.id_produto = proc.fk_produto_id_produto
inner join Desenvolvedor dev
	on p.fk_desenvolvedor_id_dev = dev.id_dev
inner join Fabricante fab
	on p.fk_fabricante_id_fab = fab.id_fab