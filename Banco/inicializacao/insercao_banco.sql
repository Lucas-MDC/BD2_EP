--Desenvolvedor
insert into Desenvolvedor(Id_dev, nome_dev) values 
  (default, 'nvidia')
, (default, 'amd')
, (default, 'intel')
, (default, 'snapdragon')
, (default, 'gigabyte')
, (default, 'msi')
, (default, 'asus')
, (default, 'kingston')
, (default, 'barracuda')
, (default, 'crucial')
, (default, 'corsair')
, (default, 'hyperx');

--Fabricante
insert into Fabricante(Id_fab, nome_fab) values 
  (default, 'gigabyte')
, (default, 'msi')
, (default, 'asus')
, (default, 'galax')
, (default, 'evga')
, (default, 'crucial')
, (default, 'corsair')
, (default, 'hyperx')
, (default, 'kingston')
, (default, 'barracuda')
, (default, 'intel')
, (default, 'amd');

--Vendedor
insert into Vendedor(id_vendedor, nome_vendedor) values 
  (default, 'berez')
, (default, 'fastshop')
, (default, 'magalu')
, (default, 'kabum')
, (default, 'lucishop')
, (default, 'pichau')
, (default, 'terabyteshop');

--Cliente
insert into Cliente(id_cliente, nome_cliente, endereco, hash_senha) values 
  (default, 'luciano Araujo','av liberdade, 363', 'B493D48364AFE44D11C0165CF470A4164D1E2609911EF998BE868D46ADE3DE4E');
, (default, 'perez', 'each, titanic, andar 1, sala 103', substring(cast(sha256('sou professor top de bd') as varchar), 3))
, (default, 'karla', 'each, titanic, andar 2, sala 206', substring(cast(sha256('mat discreta') as varchar), 3))
, (default, 'helton', 'each, titanic, andar 3, sala 309', substring(cast(sha256('mvga') as varchar), 3))
, (default, 'claudia', 'each, titanic, andar 3, sala 301', substring(cast(sha256('calculo1') as varchar), 3))
, (default, 'auil', 'each, titanic, andar 2, sala 201', substring(cast(sha256('calculo2') as varchar), 3))
, (default, 'moretop', 'each, titanic, andar 1, sala 105', substring(cast(sha256('statistica') as varchar), 3))
, (default, 'nortop', 'each, titanic, andar 2, sala 205', substring(cast(sha256('dsid') as varchar), 3))
, (default, 'violeta', 'each, titanic, andar 3, sala 304', substring(cast(sha256('governaca') as varchar), 3))

--tipo_produto
insert into tipo_produto values
  (default, 'processador')
, (default, 'placa de video')
, (default, 'memoria primaria')
, (default, 'memoria secundaria')
, (default, 'placa mae')
, (default, 'maquina');

--Interface
insert into Interface values 
  (default, 'PCI')
, (default, 'ATA')
, (default, 'SATA')
, (default, 'ISA')
, (default, 'VGA')
, (default, 'HDMI')
, (default, 'Socket AM4')
, (default, 'rPGA 988B/Socket G2')
, (default, 'DDR3')
, (default, 'DDR4');

--------------------------- Produto ---------------------------

insert into Produto values
--processador
  ('i18', default, 'rapido', 'i18', 'proc_1', 500, 3, '2019-05-03', 11, 1)
, ('i1337x3', default, 'mais rapido ainda', 'i1337x3', 'proc_1', 450, 3, '2015-02-19', 11, 1)
, ('ryzen berserk', default, '5000 nucleos seloko', 'ryzen berserk', 'proc_1', 600, 2,'2030-09-28', 12, 1)
--memoria secundaria
, ('BulletHD', default, 'rapido que nem bala', 'HD 9x19', 'hd_1', 100, 8, '2009-02-21', 9, 4)
, ('HDD 0x991', default, 'praticamente outra dimensao', 'HDD 0x991', 'hd_1', 200, 9, '2016-01-12', 10, 4)
, ('SSD Rocket', default, 'escrita e leitura voando', 'SSD IO: (3000Mhz, 3500Mhz)', 'ssd_1', 120, 8, '2018-07-05', 9, 4)
--memoria primaria
, ('memoria ram crucial', default, 'rapido', 'sodimm-h50x56abc', 'memp_1', 120, 4, '2019-05-21', 6 , 3)
, ('memoria ram corsair', default, 'mega rapido', 'scarra-h50x56abc', 'memp_1', 160, 4, '2020-06-22', 7 , 3)
, ('memoria ram hyperx', default, 'ultra rapido', 'faker-j60x56abc', 'memp_1', 200, 4, '2021-07-23', 8 , 3)
--placa mae
, ('placa mae gigabyte', default, 'bom para estudantes', 'h110m-m2b3040s', 'pmae_1', 400, 5, '2020-04-20', 1 , 5)
, ('placa mae msi', default, 'bom para trabalhar', 'lga1200-ksa213a', 'pmae_1', 500, 6, '2020-04-20', 2 , 5)
, ('placa mae asus', default, 'bom para gamers', 'lga1400-lpa12ca', 'pmae_1', 600, 7, '2020-04-20', 3 , 5)
--placa de video
, ('placa de video asus', default, 'roda tibia', 'caps-shu123lc', 'pvideo_1', 2000, 1, '2019-04-21', 3 , 2)
, ('placa de video galax', default, 'quase roda minecraft', 'chovy-ka20tr23', 'pvideo_1', 4000, 2, '2020-04-22', 4 , 2)
, ('placa de video evga', default, 'voce acha que roda cs go', 'reckless-ak30g40', 'pvideo_1', 6000, 1, '2021-04-23', 5 , 2)
--maquina
, ('PC Gamer', default, 'de gamers, para gamers', 'pcg', 'maquina_1', 9000, null, '2013-04-21', 1, 6)
, ('PC Nasa', default, 'roda crisis', 'pcn', 'maquina_1', 40000, null, '2017-04-22', 1 , 6)
, ('PC Each', default, 'depreciado desde 1997', 'pceach', 'maquina_1', 500, null, '2003-04-23', 1, 6);

--------------------------- Pecas especificas ---------------------------

--memoria primaria
insert into Memoria_Primaria values
  (4,2466,200,600,7)
, (8,2466,300,800,8)
, (16,2666,500,1000,9);

--memoria segundaria
insert into Memoria_secundaria values
  (240,2000,600,4)
, (500,2600,800,5)
, (1000,3000,3500,6);

--processador
insert into Processador values
  (125, 3.3, 4, 1, null)
, (200, 4.2, 8, 2, null)
, (3599, 250.0, 5000, 3, null);

--placa video
insert into Placa_Video values
  (1200,4,13,null)
, (2400,8,14,null)
, (3600,12,15,null);

--placa mae
insert into Placa_Mae values
  (70, 80, 9, 15, 3, 5, 10)
, (80, 85, 12, 20, 3, 3, 11)
, (90, 70, 10, 20, 4, 4, 12);

--------------------------- Tem Interface ---------------------------

insert into tem_interface values
--processador
  ( 8, 1, 1)
 ,( 7, 2, 1)
 ,( 8, 3, 1)
--mems
 ,( 2, 4, 1)
 ,( 3, 5, 1)
 ,( 3, 6, 1)
--memp
 ,( 9, 7, 1)
 ,( 10, 8, 1)
 ,( 10, 9, 1)
--pmae
 ,( 8, 10, 1) --socket proc
 ,( 3, 10, 2) --hd
 ,( 10, 10, 2) --memp
 ,( 1, 10, 1) --video
 ,( 7, 11, 2)
 ,( 3, 11, 4)
 ,( 10, 11, 4)
 ,( 1, 11, 3)
 ,( 8, 12, 1)
 ,( 2, 12, 1)
 ,( 9, 12, 1)
 ,( 1, 12, 1)
--pvideo
 ,( 1, 13, 1)
 ,( 5, 13, 1)
 ,( 1, 14, 1)
 ,( 6, 14, 4)
 ,( 1, 15, 1)
 ,( 5, 15, 3)
 ,( 6, 15, 2);

--------------------------- Tem Peca ---------------------------

insert into tem_peca values
--gamer
  ( 16, 12, 1) --pmae
, ( 16, 1, 1) --proc
, ( 16, 7, 1) --memp
, ( 16, 4, 1) --mems
, ( 16, 14, 1) --pvideo
--nasa
, ( 17, 10, 1) --pmae
, ( 17, 3, 1) --proc
, ( 17, 9, 2) --memp
, ( 17, 6, 2) --mems
, ( 17, 15, 1) --pvideo
--each
, ( 18, 11, 1) --pmae
, ( 18, 2, 2) --proc
, ( 18, 8, 3) --memp
, ( 18, 5, 2) --mems
, ( 18, 13, 1) --pvideo

