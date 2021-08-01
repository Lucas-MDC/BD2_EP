select 
	p.id_produto,
	p.nome_produto "Nome",
	p.descri "Descrição",
	p.modelo "Modelo",
	p.link_foto,
	p.preco_produto || ' R$' "Preço" ,
	substring(cast(p.data_dev as varchar), 0, 11) as "Data de desenvolvimento",
	fab.nome_fab "Fabricante", 
	peca.nome_produto, 
	tp.qtd_peca, 
	tprod.nome_tipo
from 
	Produto p
inner join tem_peca tp
	on p.id_produto = tp.fk_produto_id_produto
inner join Produto peca
	on tp.fk_produto_id_produto_ = peca.id_produto
inner join Tipo_produto tprod
	on peca.fk_tipo_produto_id_tipo = tprod.id_tipo
inner join Fabricante fab
	on p.fk_fabricante_id_fab = fab.id_fab
order by
	p.id_produto asc