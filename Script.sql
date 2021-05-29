/* MR: */

CREATE TABLE Produto (
    nome_produto VARCHAR,
    id_produto INTEGER PRIMARY KEY,
    desc VARCHAR,
    modelo VARCHAR,
    link_foto VARCHAR,
    preco_produto FLOAT,
    fk_Desenvolvedor_id_dev INTEGER,
    data_dev DATE,
    fk_Fabricante_id_fab INTEGER,
    fk_tipo_produto_id_tipo INTEGER
);

CREATE TABLE Fabricante (
    id_fab INTEGER PRIMARY KEY,
    nome_fab VARCHAR
);

CREATE TABLE Desenvolvedor (
    id_dev INTEGER PRIMARY KEY,
    nome_dev VARCHAR
);

CREATE TABLE Processador (
    Tdp_proc FLOAT,
    freq_proc FLOAT,
    cores_proc INTEGER,
    fk_Produto_id_produto INTEGER PRIMARY KEY,
    fk_Proc_serie_id_proc_serie INTEGER
);

CREATE TABLE Placa_Mae (
    Max_Tdp_cpu FLOAT,
    Temperatura_cpu FLOAT,
    Largura FLOAT,
    Comprimento FLOAT,
    Altura FLOAT,
    Tamanho_bios FLOAT,
    fk_Produto_id_produto INTEGER PRIMARY KEY
);

CREATE TABLE Memoria_primaria (
    tamanho_mem_prim FLOAT,
    freq_mem_prim FLOAT,
    leitura_mem_prim FLOAT,
    escrita_mem_prim FLOAT,
    fk_Produto_id_produto INTEGER PRIMARY KEY
);

CREATE TABLE Memoria_Secundaria (
    tamanho_mem_sec FLOAT,
    leitura_mem_sec FLOAT,
    escritura_mem_sec FLOAT,
    fk_Produto_id_produto INTEGER PRIMARY KEY
);

CREATE TABLE Placa_Video (
    freq_placa_video FLOAT,
    tamanho_memoria_placa_video FLOAT,
    fk_Produto_id_produto INTEGER PRIMARY KEY,
    fk_Placa_Video_Serie_id_placa_serie INTEGER
);

CREATE TABLE Vendedor (
    id_vendedor INTEGER PRIMARY KEY,
    nome_vendedor VARCHAR
);

CREATE TABLE Cliente (
    id_cliente INTEGER PRIMARY KEY,
    nome_cliente VARCHAR,
    endereco VARCHAR,
    hash_senha INTEGER
);

CREATE TABLE Proc_serie (
    nome_proc_serie VARCHAR,
    id_proc_serie INTEGER PRIMARY KEY
);

CREATE TABLE Operacao_venda (
    id_venda INTEGER PRIMARY KEY,
    valor_venda FLOAT,
    quantidade INTEGER,
    data_venda DATE,
    fk_Produto_id_produto INTEGER,
    fk_Vendedor_id_vendedor INTEGER,
    fk_Cliente_id_cliente INTEGER
);

CREATE TABLE Interface (
    id_interface INTEGER,
    nome_interface VARCHAR,
    PRIMARY KEY (id_interface, nome_interface)
);

CREATE TABLE Placa_Video_Serie (
    nome_placa_video_serie VARCHAR,
    id_placa_serie INTEGER PRIMARY KEY
);

CREATE TABLE tipo_produto (
    id_tipo INTEGER PRIMARY KEY,
    nome_tipo VARCHAR
);

CREATE TABLE Tem_Peca (
    fk_Produto_id_produto INTEGER,
    fk_Produto_id_produto_ INTEGER,
    qtd_peca INTEGER
);

CREATE TABLE tem_interface (
    fk_Interface_id_interface INTEGER,
    fk_Interface_nome_interface VARCHAR,
    fk_Produto_id_produto INTEGER,
    qtd_interface INTEGER
);
 
ALTER TABLE Produto ADD CONSTRAINT FK_Produto_2
    FOREIGN KEY (fk_Desenvolvedor_id_dev)
    REFERENCES Desenvolvedor (id_dev)
    ON DELETE RESTRICT;
 
ALTER TABLE Produto ADD CONSTRAINT FK_Produto_3
    FOREIGN KEY (fk_Fabricante_id_fab)
    REFERENCES Fabricante (id_fab)
    ON DELETE RESTRICT;
 
ALTER TABLE Produto ADD CONSTRAINT FK_Produto_4
    FOREIGN KEY (fk_tipo_produto_id_tipo)
    REFERENCES tipo_produto (id_tipo)
    ON DELETE RESTRICT;
 
ALTER TABLE Processador ADD CONSTRAINT FK_Processador_2
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE CASCADE;
 
ALTER TABLE Processador ADD CONSTRAINT FK_Processador_3
    FOREIGN KEY (fk_Proc_serie_id_proc_serie)
    REFERENCES Proc_serie (id_proc_serie)
    ON DELETE RESTRICT;
 
ALTER TABLE Placa_Mae ADD CONSTRAINT FK_Placa_Mae_2
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE CASCADE;
 
ALTER TABLE Memoria_primaria ADD CONSTRAINT FK_Memoria_primaria_2
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE CASCADE;
 
ALTER TABLE Memoria_Secundaria ADD CONSTRAINT FK_Memoria_Secundaria_2
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE CASCADE;
 
ALTER TABLE Placa_Video ADD CONSTRAINT FK_Placa_Video_2
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE CASCADE;
 
ALTER TABLE Placa_Video ADD CONSTRAINT FK_Placa_Video_3
    FOREIGN KEY (fk_Placa_Video_Serie_id_placa_serie)
    REFERENCES Placa_Video_Serie (id_placa_serie)
    ON DELETE RESTRICT;
 
ALTER TABLE Operacao_venda ADD CONSTRAINT FK_Operacao_venda_2
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto);
 
ALTER TABLE Operacao_venda ADD CONSTRAINT FK_Operacao_venda_3
    FOREIGN KEY (fk_Vendedor_id_vendedor)
    REFERENCES Vendedor (id_vendedor);
 
ALTER TABLE Operacao_venda ADD CONSTRAINT FK_Operacao_venda_4
    FOREIGN KEY (fk_Cliente_id_cliente)
    REFERENCES Cliente (id_cliente);
 
ALTER TABLE Tem_Peca ADD CONSTRAINT FK_Tem_Peca_1
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE CASCADE;
 
ALTER TABLE Tem_Peca ADD CONSTRAINT FK_Tem_Peca_2
    FOREIGN KEY (fk_Produto_id_produto_)
    REFERENCES Produto (id_produto)
    ON DELETE CASCADE;
 
ALTER TABLE tem_interface ADD CONSTRAINT FK_tem_interface_1
    FOREIGN KEY (fk_Interface_id_interface, fk_Interface_nome_interface)
    REFERENCES Interface (id_interface, nome_interface)
    ON DELETE RESTRICT;
 
ALTER TABLE tem_interface ADD CONSTRAINT FK_tem_interface_2
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE RESTRICT;