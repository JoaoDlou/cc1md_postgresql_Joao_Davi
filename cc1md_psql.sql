-- aluno JOAO DAVI LOURENCO DE MELLO
-- TURMA: CC1MD
-- MATRICULA: 202308771



-- CRIACAO DO BANCO DE DADOS E DO SCHEMA E DO USUARIO

CREATE DATABASE uvv

CREATE SCHEMA lojas ;

CREATE USER jotas ;

-- SETANDO O USUARIO NO SCHEMA 

ALTER SCHEMA lojas OWNER TO jotas ;
-- CRIACAO DA TABELA PRODUTOS
CREATE TABLE lojas.produtos (
                produto_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                preco_unitario NUMERIC(10,2),
                imagem BYTEA,
                detalhes BYTEA,
                imagem_mime_type VARCHAR(512),
                imagem_arquivo VARCHAR(512),
                imagem_charset VARCHAR(512) NOT NULL,
                imagem_ultima_atualizacao DATE,
                CONSTRAINT produtos_pk PRIMARY KEY (produto_id)
);
COMMENT ON TABLE lojas.produtos IS 'tabela para os produtos';
COMMENT ON COLUMN lojas.produtos.produto_id IS 'coluna para identificacao do produto';
COMMENT ON COLUMN lojas.produtos.nome IS 'coluna para o nome do produto';
COMMENT ON COLUMN lojas.produtos.preco_unitario IS 'coluna para o preco vendido por unidade';
COMMENT ON COLUMN lojas.produtos.imagem IS 'coluna para a imagem do produto';
COMMENT ON COLUMN lojas.produtos.detalhes IS 'coluna para os detalhes do produto';
COMMENT ON COLUMN lojas.produtos.imagem_mime_type IS 'coluna para o tipo de arquivo da imagem';
COMMENT ON COLUMN lojas.produtos.imagem_arquivo IS 'coluna para o arquivo da imagem';
COMMENT ON COLUMN lojas.produtos.imagem_charset IS 'coluna para o charset da imagem
';
COMMENT ON COLUMN lojas.produtos.imagem_ultima_atualizacao IS 'coluna para ultima atualizacao da imagem';

-- CRIACAO DA TABELA LOJAS

CREATE TABLE lojas.lojas (
                loja_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                endereco_web VARCHAR(100),
                endereco_fisico VARCHAR(512),
                latitude NUMERIC,
                longitude NUMERIC,
                logo BYTEA,
                logo_mime_type VARCHAR(512),
                logo_arquivo VARCHAR(512),
                logo_charset VARCHAR(512),
                logo_ultima_atualizacao DATE,
                CONSTRAINT lojas_pk PRIMARY KEY (loja_id)
);
COMMENT ON TABLE lojas.lojas IS 'tabela para as lojas';
COMMENT ON COLUMN lojas.lojas.loja_id IS 'coluna para identificaçao das lojas';
COMMENT ON COLUMN lojas.lojas.nome IS 'coluna para o nome da loja';
COMMENT ON COLUMN lojas.lojas.endereco_web IS 'coluna para o endereco da loja';
COMMENT ON COLUMN lojas.lojas.endereco_fisico IS 'coluna para o endereco fisico da loja';
COMMENT ON COLUMN lojas.lojas.latitude IS 'coluna para localizar a latitude da loja
';
COMMENT ON COLUMN lojas.lojas.longitude IS 'coluna para localizar a longitude da loja';
COMMENT ON COLUMN lojas.lojas.logo IS 'coluna para a logo da loja';
COMMENT ON COLUMN lojas.lojas.logo_mime_type IS 'coluna para o tipo da imagem da logo';
COMMENT ON COLUMN lojas.lojas.logo_arquivo IS 'coluna para colocar o arquivo da logo';
COMMENT ON COLUMN lojas.lojas.logo_charset IS 'coluna para o charset da logo';
COMMENT ON COLUMN lojas.lojas.logo_ultima_atualizacao IS 'coluna para a ultima atualizacao da logo';

-- CRIACAO DA TABELA ESTOQUES

CREATE TABLE lojas.estoques (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id VARCHAR(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                lojas_loja_id NUMERIC(38) NOT NULL,
                CONSTRAINT estoques_pk PRIMARY KEY (estoque_id)
);
COMMENT ON TABLE lojas.estoques IS 'tabela para os estoques';
COMMENT ON COLUMN lojas.estoques.estoque_id IS 'coluna para a identificacao do estoque';
COMMENT ON COLUMN lojas.estoques.loja_id IS 'coluna para a identificacao da loja';
COMMENT ON COLUMN lojas.estoques.produto_id IS 'coluna para a identificacao do produto';
COMMENT ON COLUMN lojas.estoques.quantidade IS 'coluna para a quantidade de produtos';
COMMENT ON COLUMN lojas.estoques.lojas_loja_id IS 'coluna para identificaçao das lojas';

-- CRIACAO DA TABELA CLIENTES 

CREATE TABLE lojas.clientes (
                cliente_id NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone2 VARCHAR(20),
                telefone3 VARCHAR(20),
                CONSTRAINT clientes_pk PRIMARY KEY (cliente_id)
);
COMMENT ON TABLE lojas.clientes IS 'tabela para os clientes ';
COMMENT ON COLUMN lojas.clientes.cliente_id IS 'identificaçao do cliente ';
COMMENT ON COLUMN lojas.clientes.email IS 'coluna para colocar o email do cliente';
COMMENT ON COLUMN lojas.clientes.nome IS 'coluna para colocar o nome do cliente';
COMMENT ON COLUMN lojas.clientes.telefone1 IS 'coluna para colocar o primeiro telefone do cliente';
COMMENT ON COLUMN lojas.clientes.telefone2 IS 'coluna para colocar o segundo telefone do cliente';
COMMENT ON COLUMN lojas.clientes.telefone3 IS 'coluna para o cliente colocar o terceiro telefone';

-- CRIACAO DA TABELA PEDIDOS

CREATE TABLE lojas.pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                data_hora TIMESTAMP NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                status VARCHAR(15) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                CONSTRAINT pedidos_pk PRIMARY KEY (pedido_id)
);
COMMENT ON TABLE lojas.pedidos IS 'tabela para os pedidos dos clientes';
COMMENT ON COLUMN lojas.pedidos.pedido_id IS 'coluna para identificaçao do pedido do cliente';
COMMENT ON COLUMN lojas.pedidos.data_hora IS 'coluna para data e hora dos pedidos';
COMMENT ON COLUMN lojas.pedidos.cliente_id IS 'coluna para identificacao dos clientes';
COMMENT ON COLUMN lojas.pedidos.status IS 'coluna para o status do pedido do cliente';
COMMENT ON COLUMN lojas.pedidos.loja_id IS 'coluna para a identificacao da loja ';

-- CRIACAO DA TABELA ENVIOS 

CREATE TABLE lojas.envios (
                envio_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                CONSTRAINT envios_pk PRIMARY KEY (envio_id)
);
COMMENT ON TABLE lojas.envios IS 'tabela para os envios ';
COMMENT ON COLUMN lojas.envios.envio_id IS 'coluna para identificaçao dos envios';
COMMENT ON COLUMN lojas.envios.loja_id IS 'coluna para a identificacao da loja';
COMMENT ON COLUMN lojas.envios.cliente_id IS 'coluna para identificacao do cliente';
COMMENT ON COLUMN lojas.envios.endereco_entrega IS 'coluna para o endereco de entrega ';
COMMENT ON COLUMN lojas.envios.status IS 'coluna para o status do pedido';

-- CRIACAO DA TABELA DOS ITENS PEDIDOS

CREATE TABLE lojas.pedidos_itens (
                pedido_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                envio_id NUMERIC,
                envios_envio_id NUMERIC(38) NOT NULL,
                CONSTRAINT pedidos_itens_pk PRIMARY KEY (pedido_id, produto_id)
);
COMMENT ON TABLE lojas.pedidos_itens IS 'tabela para os itens pedidos';
COMMENT ON COLUMN lojas.pedidos_itens.pedido_id IS 'coluna para a identificacao do pedido';
COMMENT ON COLUMN lojas.pedidos_itens.produto_id IS 'coluna para a identificacao do produto';
COMMENT ON COLUMN lojas.pedidos_itens.numero_da_linha IS 'coluna para o numero da linha';
COMMENT ON COLUMN lojas.pedidos_itens.preco_unitario IS 'coluna para o preco da unidade';
COMMENT ON COLUMN lojas.pedidos_itens.quantidade IS 'coluna para a quantidade de produtos';
COMMENT ON COLUMN lojas.pedidos_itens.envio_id IS 'coluna para identificacao do envio';
COMMENT ON COLUMN lojas.pedidos_itens.envios_envio_id IS 'coluna para identificaçao dos envios';


ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES lojas.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES lojas.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (lojas_loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES lojas.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES lojas.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES lojas.pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envios_envio_id)
REFERENCES lojas.envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
