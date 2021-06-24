CREATE OR REPLACE FUNCTION delete_vendas_recentes_intel()
RETURNS TRIGGER language plpgsql
as
$$
BEGIN

	delete from Operacao_venda
	where
		    (OLD.id_venda = id_venda OR (OLD.id_venda is null))
		AND (OLD.valor_venda = valor_venda OR (OLD.valor_venda is null))
		AND (OLD.quantidade = quantidade OR (OLD.quantidade is null))
		AND (OLD.data_venda = data_venda OR (OLD.data_venda is null))
		AND (OLD.fk_produto_id_produto = fk_produto_id_produto OR (OLD.fk_produto_id_produto is null))
		AND (OLD.fk_vendedor_id_vendedor = fk_vendedor_id_vendedor OR (OLD.fk_vendedor_id_vendedor is null))
		AND (OLD.fk_cliente_id_cliente = fk_cliente_id_cliente OR (OLD.fk_cliente_id_cliente is null))
		AND (OLD.dias_distancia = dias_distancia OR (OLD.dias_distancia is null));
		
    return NULL;
END;
$$;

create trigger trigger_delete_vendas_recentes_intel
instead of delete on vendas_recentes_intel
for each row execute procedure delete_vendas_recentes_intel();