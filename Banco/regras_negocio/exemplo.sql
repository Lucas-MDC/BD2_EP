CREATE OR REPLACE FUNCTION integridade_divisao()
RETURNS TRIGGER language plpgsql
as
$$
BEGIN
	insert into Chefe_Militar   
	(faixa, nome, nome_l, cod_g, id_divisao, cod_divisao)
	select
		0, div.nome || ' desconhecido', ld.nome_l, ld.cod_g, div.id_divisao, div.cod_g
    from
        Divisao div
    left join
        Chefe_Militar cm
    on
        cm.id_divisao = div.id_divisao
        and
        cm.cod_divisao = div.cod_g
	inner join
		lider_politico ld
	on
		ld.nome_l = 'desconhecido'
    where
        cm.cod_chefe is null;

    return NEW;
END;
$$;

create trigger trigger_integridade_divisao
after insert on Divisao
for each statement execute procedure integridade_divisao();