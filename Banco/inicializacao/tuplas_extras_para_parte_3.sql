--placa de video
insert into Produto values
, ('placa de video asus II', default, 'roda tibia', 'caps-shu123lc', 'pvideo_1', 4000, 1, '2019-04-21', 3 , 2)
, ('placa de video galax II', default, 'quase roda minecraft', 'chovy-ka20tr23', 'pvideo_1', 5000, 2, '2020-04-22', 4 , 2)
, ('placa de video evga II', default, 'voce acha que roda cs go', 'reckless-ak30g40', 'pvideo_1', 8000, 1, '2021-04-23', 5 , 2)
, ('placa de video asus III', default, 'roda tibia', 'caps-shu123lc', 'pvideo_1', 1000, 1, '2019-04-21', 3 , 2)
, ('placa de video galax III', default, 'quase roda minecraft', 'chovy-ka20tr23', 'pvideo_1', 4000, 2, '2020-04-22', 4 , 2)
, ('placa de video evga III', default, 'voce acha que roda cs go', 'reckless-ak30g40', 'pvideo_1', 3100, 1, '2021-04-23', 5 , 2)
, ('placa de video asus IV', default, 'roda tibia', 'caps-shu123lc', 'pvideo_1', 2300, 1, '2019-04-21', 3 , 2)
, ('placa de video galax IV', default, 'quase roda minecraft', 'chovy-ka20tr23', 'pvideo_1', 4500, 2, '2020-04-22', 4 , 2)
, ('placa de video evga IV', default, 'voce acha que roda cs go', 'reckless-ak30g40', 'pvideo_1', 6200, 1, '2021-04-23', 5 , 2)

insert into Placa_Video values
  (1560,4, 19,null)
, (1300,8, 20,null)
, (9600,12, 21,null)
, (6700,4, 22,null)
, (2131,8, 23,null)
, (1123,12, 24,null)
, (3220,4, 25,null)
, (4400,8, 26,null)
, (2650,12, 27,null)

insert into tem_interface values
  ( 1, 19, 1)
 ,( 5, 19, 2)
 ,( 1, 20, 3)
 ,( 6, 20, 3)
 ,( 5, 20, 1)
 ,( 5, 21, 2)
 ,( 6, 22, 1)
 ,( 5, 22, 2)
 ,( 6, 23, 3)
 ,( 5, 23, 4)
 ,( 1, 24, 2)
 ,( 5, 24, 1)
 ,( 1, 25, 1)
 ,( 5, 26, 1)
 ,( 1, 26, 2)
 ,( 6, 27, 1)
 
 --placa mae
 insert into Produto values
  ('placa mae gigabyte II', default, 'bom para estudantes', 'h110m-m2b3040s', 'pmae_1', 400, 5, '2020-04-20', 1 , 5)
, ('placa mae msi II', default, 'bom para trabalhar', 'lga1200-ksa213a', 'pmae_1', 500, 6, '2020-04-20', 2 , 5)
, ('placa mae asus II', default, 'bom para gamers', 'lga1400-lpa12ca', 'pmae_1', 600, 7, '2020-04-20', 3 , 5)
, ('placa mae gigabyte III', default, 'bom para estudantes', 'h110m-m2b3040s', 'pmae_1', 400, 5, '2020-04-20', 1 , 5)
, ('placa mae msi III', default, 'bom para trabalhar', 'lga1200-ksa213a', 'pmae_1', 500, 6, '2020-04-20', 2 , 5)
, ('placa mae asus III', default, 'bom para gamers', 'lga1400-lpa12ca', 'pmae_1', 600, 7, '2020-04-20', 3 , 5)
, ('placa mae gigabyte IV', default, 'bom para estudantes', 'h110m-m2b3040s', 'pmae_1', 400, 5, '2020-04-20', 1 , 5)
, ('placa mae msi IV', default, 'bom para trabalhar', 'lga1200-ksa213a', 'pmae_1', 500, 6, '2020-04-20', 2 , 5)
, ('placa mae asus IV', default, 'bom para gamers', 'lga1400-lpa12ca', 'pmae_1', 600, 7, '2020-04-20', 3 , 5)

insert into tem_interface values
  ( 7, 28, 1)
  ,( 3, 28, 2)
  ,( 10, 28, 3)
  ,( 1, 28, 1)
  
  ,( 7, 29, 2)
  ,( 3, 29, 2)
  ,( 10, 29, 3)
  ,( 1, 29, 3)
  
  ,( 8, 30, 1)
  ,( 2, 30, 1)
  ,( 9, 30, 1)
  ,( 1, 30, 1)
  
  ,( 8, 31, 1)
  ,( 3, 31, 1)
  ,( 10, 31, 2)
  ,( 1, 31, 1)
  
  ,( 8, 32, 2)
  ,( 3, 32, 1)
  ,( 9, 32, 1)
  ,( 1, 32, 2)
  
  ,( 7, 33, 2)
  ,( 3, 33, 3)
  ,( 10, 33, 1)
  ,( 1, 33, 2)
  
  ,( 8, 34, 1)
  ,( 3, 34, 2)
  ,( 10, 34, 3)
  ,( 1, 34, 1)
  
  ,( 7, 35, 1)
  ,( 3, 35, 1)
  ,( 10, 35, 3)
  ,( 1, 35, 3)
  
  ,( 7, 36, 3)
  ,( 2 ,36, 3)
  ,( 10, 36, 3)
  ,( 1, 36, 3)

--MAQUINAS
insert into Produto values
  ('PC Gamer II', default, 'de gamers, para gamers', 'pcg', 'maquina_1', 7030, null, '2013-04-21', 1, 6)
, ('PC Nasa II', default, 'roda crisis', 'pcn', 'maquina_1', 75900, null, '2017-04-22', 1 , 6)
, ('PC Each bixo', default, 'depreciado desde 1997', 'pceach', 'maquina_1', 610, null, '2003-04-23', 1, 6)
, ('PC Gamer III', default, 'de gamers, para gamers', 'pcg', 'maquina_1', 5530, null, '2013-04-21', 1, 6)
, ('PC Nasa III', default, 'roda crisis', 'pcn', 'maquina_1', 125000, null, '2017-04-22', 1 , 6)
, ('PC Each veterano', default, 'depreciado desde 1997', 'pceach', 'maquina_1', 290, null, '2003-04-23', 1, 6)
, ('PC Gamer IV', default, 'de gamers, para gamers', 'pcg', 'maquina_1', 6530, null, '2013-04-21', 1, 6)
, ('PC Nasa IV', default, 'roda crisis', 'pcn', 'maquina_1', 32331, null, '2017-04-22', 1 , 6)
, ('PC Each morrendo', default, 'depreciado desde 1997', 'pceach', 'maquina_1', 120, null, '2003-04-23', 1, 6)
