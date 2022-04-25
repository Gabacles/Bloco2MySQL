# Crie um banco de dados para um serviço de uma quitanda, onde o sistema trabalhará com as informações dos produtos desta empresa. 

CREATE DATABASE db_quitanda_vanguarda;
USE db_quitanda_vanguarda;

# Crie uma tabela de categorias para esses produtos.

CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    ativo BOOLEAN NOT NULL,
    PRIMARY KEY (id)
);

# Crie uma tabela de produtos e determine 5 atributos relevantes para se trabalhar com o serviço desta quitanda / Faça o relacionamento de categorias na tabela de produto através da foreign key (id_categoria).

CREATE TABLE tb_produtos(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2),
    quantidade INT NOT NULL,
    id_categoria BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES tb_categoria(id)
);

# Insira nestas tabelas no mínimo 5 dados (registros).

INSERT INTO tb_categoria(nome, ativo)
	VALUES
		("In-natura", true),
        ("Processado", true),
		("UltraProcessado", true);
        
INSERT INTO tb_produtos(nome, valor, quantidade, id_categoria)
	VALUES
		("Laranja", 12.99, 100, 1),
        ("Milho", 16.99, 100, 1),
        ("Salmão", 60.50, 80, 1),
        ("Pêssego em Calda", 13.99, 50, 2),
        ("Atum Enlatado", 8.45, 200, 2),
        ("Abacaxi em Calda", 15.99, 100, 2),
        ("Salgadinho Doritos", 7.99, 300, 3),
        ("Suco Tang Uva", 1.50, 1000, 3),
		("Nuggets 500gr", 16.70, 200, 3);
        
# Faça um SELECT que retorne todos os produtos.

SELECT * FROM tb_produtos;

# Faça um SELECT que retorne todas as categorias.

SELECT * FROM tb_categoria;

# Faça um SELECT que retorne todos os produtos com o valor maior do que 50.

SELECT * FROM tb_produtos
WHERE valor > 50;

# Faça um SELECT que retorne todos os produtos que contém a letra %a%.

SELECT * FROM tb_produtos
WHERE nome LIKE "%a%";

# Ao término atualize um registro desta tabela através de uma query de atualização.

UPDATE tb_produtos SET valor = 65.99
WHERE id = 3;