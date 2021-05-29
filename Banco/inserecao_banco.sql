INSERT INTO Desenvolvedor(Id_dev, nome_dev) VALUES 
(DEFAULT, 'nvidia')
, (DEFAULT, 'amd')
, (DEFAULT, 'intel')
, (DEFAULT, 'snapdragon')
, (DEFAULT, 'gigabyte')
, (DEFAULT, 'msi')
, (DEFAULT, 'asus')
, (DEFAULT, 'kingston')
, (DEFAULT, 'barracuda')
, (DEFAULT, 'crucial')
, (DEFAULT, 'corsair')
, (DEFAULT, 'hyperx');

INSERT INTO Fabricante(Id_fab, nome_fab) VALUES 
(DEFAULT, 'gigabyte')
, (DEFAULT, 'msi')
, (DEFAULT, 'asus')
, (DEFAULT, 'galax')
, (DEFAULT, 'evga')
, (DEFAULT, 'crucial')
, (DEFAULT, 'corsair')
, (DEFAULT, 'hyperx')
, (DEFAULT, 'kingston')
, (DEFAULT, 'barracuda')
, (DEFAULT, 'intel')
, (DEFAULT, 'amd');

INSERT INTO Vendedor(id_vendedor, nome_vendedor) VALUES 
(DEFAULT, 'berez')
, (DEFAULT, 'fastshop')
, (DEFAULT, 'magalu')
, (DEFAULT, 'kabum')
, (DEFAULT, 'lucishop')
, (DEFAULT, 'pichau')
, (DEFAULT, 'terabyteshop');

INSERT INTO Cliente(id_cliente, nome_cliente, endereco, hash_senha) VALUES 
(DEFAULT, 'luciano Araujo','av liberdade, 363', 'B493D48364AFE44D11C0165CF470A4164D1E2609911EF998BE868D46ADE3DE4E');

insert into tipo_produto values
(default, 'processador'),
(default, 'placa de video'),
(default, 'memoria primaria'),
(default, 'memoria secundaria'),
(default, 'placa mae'),
(default, 'maquina');

insert into Interface values 
(default, 'PCI'),
(default, 'ATA'),
(default, 'SATA'),
(default, 'ISA'),
(default, 'VGA'),
(default, 'HDMI'),
(default, 'Socket AM4'),
(default, 'rPGA 988B/Socket G2');

--------- PRODUTO ---------

--processador
insert into Produto values
('i18', default, 'rapido', 'i18', 'proc_1', 500, 3, '2019-05-03', 11, 1),
('i1337x3', default, 'mais rapido ainda', 'i1337x3', 'proc_1', 450, 3, '2015-02-19', 11, 1),
('ryzen berserk', default, '5000 nucleos seloko', 'ryzen berserk', 'proc_1', 600, 2,'2030-09-28', 12, 1),

--memoria secundaria
('BulletHD', default, 'rapido que nem bala', 'HD 9x19', 'hd_1', 100, 8, '2009-02-21', 9, 4),
('HDD 0x991', default, 'praticamente outra dimensao', 'HDD 0x991', 'hd_1', 200, 9, '2016-01-12', 10, 4),
('SSD Rocket', default, 'escrita e leitura voando', 'SSD IO: (3000Mhz, 3500Mhz)', 'ssd_1', 120, 8, '2018-07-05', 9, 4),

--memoria primaria
('memoria ram crucial', default, 'rapido', 'sodimm-h50x56abc', 'memp_1', 120, 4, '2019-05-21', 6 , 3),
('memoria ram corsair', default, 'mega rapido', 'scarra-h50x56abc', 'memp_1', 160, 4, '2020-06-22', 7 , 3),
('memoria ram hyperx', default, 'ultra rapido', 'faker-j60x56abc', 'memp_1', 200, 4, '2021-07-23', 8 , 3),

--placa mae
('placa mae gigabyte', default, 'bom para estudantes', 'h110m-m2b3040s', 'pmae_1', 400, 5, '2020-04-20', 1 , 5),
('placa mae msi', default, 'bom para trabalhar', 'lga1200-ksa213a', 'pmae_1', 500, 6, '2020-04-20', 2 , 5),
('placa mae asus', default, 'bom para gamers', 'lga1400-lpa12ca', 'pmae_1', 600, 7, '2020-04-20', 3 , 5),

--placa de video--
('placa de video asus', default, 'roda tibia', 'caps-shu123lc', 'pvideo_1', 2000, 1, '2019-04-21', 3 , 2),
('placa de video galax', default, 'quase roda minecraft', 'chovy-ka20tr23', 'pvideo_1', 4000, 2, '2020-04-22', 4 , 2),
('placa de video evga', default, 'voce acha que roda cs go', 'reckless-ak30g40', 'pvideo_1', 6000, 1, '2021-04-23', 5 , 2),

--maquina--
('PC Gamer', default, 'de gamers, para gamers', 'pcg', 'maquina_1', 9000, null, '2013-04-21', 1, 6),
('PC Nasa', default, 'roda crisis', 'pcn', 'maquina_1', 40000, null, '2017-04-22', 1 , 6),
('PC Each', default, 'depreciado desde 1997', 'pceach', 'maquina_1', 500, null, '2003-04-23', 1, 6);



