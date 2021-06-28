create trigger serie_padrao_processador after insert on Processador
referencing new row as nrow
for each row
begin atomic
    insert into 
        Proc_serie
    select 
        p.nome_produto || ' Serie ' || pr.fk_Produto_id_produto
    from 
        Processador pr 
    inner join Produto p
        on p.id_produto = pr.fk_Produto_id_produto
    where 
        NEW.fk_Proc_serie_id_proc_serie is null
        and
        pr.fk_Produto_id_produto = NEW.fk_Produto_id_produto;

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
            on ps.nome_proc_serie = (p.nome_produto || ' Serie ' || NEW.fk_Produto_id_produto)
    ) x
    where
        x.fk_Produto_id_produto = pr.fk_Produto_id_produto;
end