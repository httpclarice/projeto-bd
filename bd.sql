CREATE TABLE CLIENTE 
( 
 COD_CLI SERIAL PRIMARY KEY, 
 NOM_CLI VARCHAR (50) NOT NULL, 
 LIMITE VARCHAR (35), 
 FONE VARCHAR (14) 
);

CREATE TABLE PEDIDO 
( 
 NUM_PED SERIAL PRIMARY KEY, 
 DAT_PED DATE, 
 COD_CLI INTEGER NOT NULL, 
 DAT_PGTO DATE, 
 SITUACAO VARCHAR, 
 COD_CLIENTE INTEGER NOT NULL, 
 CONSTRAINT FK_COD_CLIENTE FOREIGN KEY (COD_CLIENTE) REFERENCES 
CLIENTE (COD_CLI) 
); 

CREATE TABLE ITEM_PEDIDO 
( 
 NUM_PED INTEGER, 
 COD_PROD SERIAL PRIMARY KEY, 
 QTD INTEGER NOT NULL, 
 VAL_PROD DECIMAL(10,2) NOT NULL, 
 NUM_PEDIDO INTEGER, 
 CONSTRAINT FK_NUM_PEDIDO FOREIGN KEY (NUM_PEDIDO) REFERENCES 
PEDIDO (NUM_PED) 
 
); 
CREATE TABLE PRODUTO 
( 
 COD_PROD SERIAL PRIMARY KEY, 
 DSC_PROD VARCHAR (50), 
 VALOR INTEGER NOT NULL, 
 TPO_PROD VARCHAR (30), 
) 

-- AÇÃO DE APRENDIZAGEM 2 

SELECT * FROM CLIENTE 
 INNER JOIN item_pedido ON item_pedido.COD_PROD = CLIENTE.cod_cli 
 inner join pedido on pedido.num_ped = item_pedido.num_ped 
 where num_pedido = 5 

-- letra b 

SELECT * FROM CLIENTE 
 INNER JOIN item_pedido ON item_pedido.COD_PROD = CLIENTE.cod_cli 
 inner join pedido on pedido.num_ped = item_pedido.num_ped 
 where nom_cli = 'Ricardo' 
 and qtd = 5 

-- letra c 

SELECT * FROM CLIENTE 
 INNER JOIN item_pedido ON item_pedido.COD_PROD = CLIENTE.cod_cli 
 where nom_cli = 'Ricardo' 
 and cod_prod is not null 
 
-- letra d 

select * from pedido 
 where dat_ped BETWEEN ('01/10/2022') and ('30/11/2022') 
 and situacao = 'pendente'