CREATE OR REPLACE FUNCTION serie_padrao_processador()
RETURNS TRIGGER language plpgsql
as
$$
BEGIN
    --Insere uma nova seria para o novo prcoessador
    insert into 
        Proc_serie
    select 
    --Nome da serie tem que ser unico porem legivel, entao junta-se o nome do produto (nao unico),
    --um indicador de serie e a chave do produto (unica).
        p.nome_produto || ' Serie ' || pr.fk_Produto_id_produto
    from 
        Processador pr 
    inner join Produto p
        on p.id_produto = pr.fk_Produto_id_produto
    where 
        --So para processadores novos que não tem serie
        NEW.fk_Proc_serie_id_proc_serie is null
        and
        --Tem que ser o processdor certo ativado pelo trigger for each row
        pr.fk_Produto_id_produto = NEW.fk_Produto_id_produto;

    --Atualiza o novo processador com sua nova série padrão
    update
        Processador pr
    set
        fk_Proc_serie_id_proc_serie = x.id_proc_serie
    from
    (
        select 
            *
        from
            Processador pr
        inner join Produto p
            on p.id_produto = pr.fk_Produto_id_produto
        inner join Proc_serie ps
            --Join pelo nome da serie que é unico
            --Tem que ser o processdor certo ativado pelo trigger for each row
            on ps.nome_proc_serie = (p.nome_produto || ' Serie ' || NEW.fk_Produto_id_produto)
    ) x
    where
        x.fk_Produto_id_produto = pr.fk_Produto_id_produto;

    return NULL;
END;
$$;

create trigger trigger_serie_padrao_processador
after insert on Processador
for each row execute procedure serie_padrao_processador();