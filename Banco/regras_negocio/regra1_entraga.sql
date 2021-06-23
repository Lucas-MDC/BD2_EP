create assertion consistencia_tem_peca check
(   not exists
    (   select 
            *
        from
            tem_peca
        where
        fk_Produto_id_produto not in 
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
        fk_Produto_id_produto_ in 
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
    )
)