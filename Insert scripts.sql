INSERT INTO Desenvolvedor(Id_dev, nome_dev) VALUES (DEFAULT, 'nvidia')
, (DEFAULT, 'amd')
, (DEFAULT, 'intel')
, (DEFAULT, 'snapdragon');

INSERT INTO Fabricante(Id_fab, nome_fab) VALUES (DEFAULT, 'gigabyte')
, (DEFAULT, 'msi')
, (DEFAULT, 'asus')
, (DEFAULT, 'galax')
, (DEFAULT, 'evga');


INSERT INTO Vendedor(id_vendedor, nome_vendedor) VALUES (DEFAULT, 'berez')
, (DEFAULT, 'fastshop')
, (DEFAULT, 'magalu')
, (DEFAULT, 'kabum')
, (DEFAULT, 'lucishop')
, (DEFAULT, 'pichau')
, (DEFAULT, 'terabyteshop');


INSERT INTO Cliente(id_cliente, nome_cliente, endereco, hash_senha) VALUES (DEFAULT, 'luciano Araujo','av liberdade, 363', 'B493D48364AFE44D11C0165CF470A4164D1E2609911EF998BE868D46ADE3DE4E')

INSERT INTO PRODUTO
(
    nome_produto
    ,id_produto
    ,descri
    ,modelo
    ,link_foto
    ,preco_produto
    ,fk_Desenvolvedor_id_dev
    ,data_dev
    ,fk_Fabricante_id_fab
    ,fk_tipo_produto_id_tipo
)

/*PRODUTO - Memoria Primaria */
('memoria ram crucial', default, 'rapido', 'sodimm-h50x56abc', '', 120, 4, '2019-05-21', 6 , 3),
('memoria ram corsair', default, 'mega rapido', 'scarra-h50x56abc', '', 160, 4, '2020-06-22', 7 , 3),
('memoria ram hyperx', default, 'ultra rapido', 'faker-j60x56abc', '', 200, 4, '2021-07-23', 8 , 3);

/*PRODUTO - Placa Mae */
('placa mae gigabyte', default, 'bom para estudantes', 'h110m-m2b3040s', '', 400, 5, '2019-05-21', 1 , 5),
('placa mae msi', default, 'bom para trabalhar', 'lga1200-ksa213a', '', 500, 6, '2020-06-22', 2 , 5),
('placa mae asus', default, 'bom para gamers', 'lga1400-lpa12ca', '', 600, 7, '2021-07-23', 3 , 5);

/*PRODUTO - Placa de Video */
('placa de video asus', default, 'roda tibia', 'caps-shu123lc', '', 2000, 1, '2019-04-21', 3 , 2),
('placa de video galax', default, 'quase roda minecraft', 'chovy-ka20tr23', '', 4000, 2, '2020-04-22', 4 , 2),
('placa de video evga', default, 'voce acha que roda cs go', 'reckless-ak30g40', '', 6000, 1, '2021-04-23', 5 , 2);

/* Memoria Primaria */
INSERT INTO Memoria Primaria
(
    tamanho_mem_prim
    , freq_mem_prim
    , leitura_mem_prim
    , escritura_mem_prim
    , fk_Produto_id_produto
)

/* Memoria Primaria */
(4,2466,200,600,7)
(8,2466,300,800,8)
(16,2666,500,1000,9)

INSERT INTO Memoria Secundaria
(
    tamanho_mem_prim
    , leitura_mem_prim
    , escritura_mem_prim
    , fk_Produto_id_produto
)

/* Memoria Secundaria */
(240,2000,600,4)
(500,2600,800,5)
(1000,3000,3500,6)

INSERT INTO Placa_Video
(
    freq_placa_video
    ,tamanho_memoria_placa_video
    ,fk_Produto_id_produto
    ,fk_Placa_Video_Serie_id_placa_serie
)

/* Placa de video */
(1200,4,13,null)
(2400,8,14,null)
(3600,12,15,null)

/* Placa_Video_Serie */




