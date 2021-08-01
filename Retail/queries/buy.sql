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
	p.preco_produto,
    1 quantidade,
	CURRENT_DATE data_venda,
	;pid id_produto,
	8 fk_vendedor_id_vendedor,
	;clid fk_cliente_id_cliente
from
	Produto p
where
	id_produto = ;pid