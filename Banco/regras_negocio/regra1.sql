CREATE OR REPLACE FUNCTION consistencia_tem_pecas()
RETURNS TRIGGER language plpgsql
as
$$
declare num int;
BEGIN
    --É feita contagem de linhas que batem o critério de exceção
    num := (
        select
            count(*)
        --São selecionados os valores que a nova linha terá
        from 
            (select NEW.fk_Produto_id_produto fk_Produto_id_produto, NEW.fk_Produto_id_produto_ fk_Produto_id_produto_) x
        where
            --Um peça que tem outra, tem que ser uma maquina
            x.fk_Produto_id_produto not in 
            (
                select
                    id_produto
                from
                    produto p 
                inner join tipo_produto tp 
                    on p.fk_tipo_produto_id_tipo = tp.id_tipo
                where
                    nome_tipo = 'maquina'
            )
            or 
            --Um peça que é tida, não pode ser uma maquina
            x.fk_Produto_id_produto_ in 
            (
                select
                    id_produto
                from
                    produto p 
                inner join tipo_produto tp 
                    on p.fk_tipo_produto_id_tipo = tp.id_tipo
                where
                    nome_tipo = 'maquina'
            ));

        --Joga exceção, impedindo o insert ou update
        if (num > 0) then
		    RAISE EXCEPTION 'Só maquinas podem ter peças, máquinas não podem ter elas mesmas e maquinas não podem ser tidas por outras maquinas.';
        end if;

        return NEW;
END;
$$;

create trigger trigger_consistencia_pecas 
before insert or update on tem_peca
for each row execute procedure consistencia_tem_pecas();