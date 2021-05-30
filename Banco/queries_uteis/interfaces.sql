select 
	p.nome_produto,
	int.nome_interface,
	tint.qtd_interface
from 
	tem_interface tint
inner join
	produto p
on
	p.id_produto = tint.fk_produto_id_produto
inner join
	interface int
on
	int.id_interface = tint.fk_interface_id_interface;