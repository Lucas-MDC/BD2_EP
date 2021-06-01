## Consulta 1 

    π p . nome_produto, tp . nome_tipo, COUNT (*)
    γ id_produto, nome_tipo, COUNT (*)
    σ tp . nome_tipo <> "maquina"
        (ρ ov operacao_venda ⋈ ov . fk_produto_id_produto = p . id_produto
        ρ p produto ⋈ p . fk_tipo_produto_id_tipo = tp . id_tipo
        ρ tp tipo_produto)

## Consulta 2 

Impossível por causa do ```over (partition by)```

## Consulta 3 

    γ nome_produto, preco_produto, SUM (?column?)
    (ρ maquina
    π p . nome_produto, p . id_produto, p . preco_produto, p . fk_tipo_produto_id_tipo, tp . fk_produto_id_produto_, tp . qtd_peca
        (ρ tp tem_peca ⋈ tp . fk_produto_id_produto = p . id_produto
        ρ p produto) ⋈ maquina . fk_produto_id_produto_ = p . id_produto
        ρ p produto ⋈ p . fk_tipo_produto_id_tipo = tprod . id_tipo
        ρ tprod tipo_produto)

## Consulta 4 

    γ nome_produto, COUNT (nome_produto)
    σ tprod . nome_tipo = "placa mae"
    (ρ p produto ⋈ p . fk_tipo_produto_id_tipo = tprod . id_tipo
        ρ tprod tipo_produto ⋈ p . id_produto = tint . fk_produto_id_produto
        ρ tint tem_interface ⋈ tint . fk_interface_id_interface = pecas . fk_interface_id_interface
        ρ pecas
        π p . id_produto, tint . fk_interface_id_interface
            σ NOT (tprod . nome_tipo = "placa mae" OR tprod . nome_tipo = "maquina")
            (ρ p produto ⋈ p . fk_tipo_produto_id_tipo = tprod . id_tipo
            ρ tprod tipo_produto ⋈ p . id_produto = tint . fk_produto_id_produto
            ρ tint tem_interface))