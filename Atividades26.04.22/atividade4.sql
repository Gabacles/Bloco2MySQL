/* ATIVIDADE 4

Crie um banco de dados para um serviço de um Açougue ou de um Hortifruti. 
O nome do Banco de dados deverá ter o seguinte nome db_cidade_das_carnes ou cidade_dos_vegetais. 
O sistema trabalhará com as informações dos produtos comercializados pela empresa. 
O sistema trabalhará com 2 tabelas tb_produtos e tb_categorias, que deverão estar relacionadas. */

CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

# 1 - Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os produtos.

CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255),
    PRIMARY KEY (id)
);

# 2 - Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.

CREATE TABLE tb_produtos(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL,
    tipo VARCHAR(20),
    id_categoria BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

# 3 - Insira 5 registros na tabela tb_categorias.

INSERT INTO tb_categorias(nome, descricao)
	VALUES
		("Ave", "Corresponde às obtidas aves domésticas de criação"),
        ("Bovina", "Carne bovina é a carne extraída dos bovinos, especialmente do gado doméstico"),
        ("Suina", "A carne de porco (ou carne suína) é todo tipo de carne obtida a partir do porco doméstico (Sus domesticus)"),
        ("Peixe", "Carne de peixe, também chamada de pescado, é derivada de todos os peixes, crustáceos, moluscos, anfíbios, quelônios e mamíferos, de água doce ou salgada"),
        ("Processada", "Carne processada é qualquer tipo de carne que tenha sido transformada por salga, cura, fermentação, defumação e outros processos para realçar sabor ou melhorar a preservação.");

# 4 - Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.

INSERT INTO tb_produtos(nome, valor, ativo, tipo, id_categoria)
	VALUES
		("Filé Mignon", 85.99, true, "Primeira", 2),
        ("Picanha", 70.90, true, "Primeira", 2),
        ("Bisteca", 45.60, true, "Primeira", 3),
        ("Pernil", 35.49, true, "Primeira", 3),
        ("Linguiça", 28.70, true, "", 5),
        ("Frango", 30.60, true, "", 1),
        ("Salmão", 80.50, true, "", 4),
        ("Acém", 39, true, "Segunda", 2);
        
# 5 - Faça um SELECT que retorne todas as carnes cujo valor seja maior do que R$ 50,00.

SELECT * FROM tb_produtos
WHERE valor > 50;

# 6 - Faça um SELECT que retorne todas as carnes cujo valor esteja no intervalo R$ 5,00 e R$ 60,00.

SELECT * FROM tb_produtos
WHERE valor BETWEEN 50 AND 150;

# 7 - Faça um SELECT utilizando o operador LIKE, buscando todas as carnes que possuam a letra C no atributo nome.

SELECT * FROM tb_produtos
WHERE nome LIKE "%c%";

# 8 - Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.

SELECT * FROM tb_produtos as p
INNER JOIN tb_categorias as c ON p.id_categoria = c.id;

# 9 - Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria aves ou frutas).

SELECT * FROM tb_produtos as p
INNER JOIN tb_categorias as c ON p.id_categoria = c.id
WHERE c.nome = "Bovina";