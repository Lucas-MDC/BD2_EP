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
	freq_placa_video || 'MHz' "Frequência",
	tamanho_memoria_placa_video || 'Gb' "Memória de video"
from 
	Produto p
inner join Placa_Video pv
	on p.id_produto = pv.fk_produto_id_produto
inner join Desenvolvedor dev
	on p.fk_desenvolvedor_id_dev = dev.id_dev
inner join Fabricante fab
	on p.fk_fabricante_id_fab = fab.id_fab