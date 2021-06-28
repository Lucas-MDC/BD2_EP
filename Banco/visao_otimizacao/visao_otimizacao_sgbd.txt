create view pecas_conectam_placa_mae as
select
	p.id_produto,
	tint.fk_interface_id_interface
from
	tipo_produto tprod
--Junta o produto com seu tipo
inner join produto p
	on p.fk_tipo_produto_id_tipo = tprod.id_tipo
--Pega as interfaces que o produto tem
inner join tem_interface tint
	on p.id_produto = tint.fk_produto_id_produto
where
	--Não é placa mãe nem máquina, só peças que se conectam com placa mãe
	tprod.nome_tipo not in ('placa mae', 'maquina')	