/* ATIVIDADE 3

Crie um banco de dados para um serviço de uma Farmácia. 
O nome do Banco de dados deverá ter o seguinte nome db_farmacia_bem_estar. 
O sistema trabalhará com as informações dos produtos comercializados pela empresa. 
O sistema trabalhará com 2 tabelas tb_produtos e tb_categorias, que deverão estar relacionadas. */

CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

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
    prescricao_medica BOOLEAN NOT NULL,
    tipo VARCHAR(20),
    id_categoria BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

# 3 - Insira 5 registros na tabela tb_categorias.

INSERT INTO tb_categorias(nome, descricao)
	VALUES
		("Medicamento Similar", "É aquele que apresenta a mesma concentração, forma farmacêutica, via de administração, posologia e indicação terapêutica, preventiva ou diagnóstica, em comparação ao medicamento de referência."),
        ("Medicamento Genérico", "É o medicamento registrado pelo nome genérico ou químico da substância ativa que o compõe, mas que não possui os testes de biodisponibilidade."),
        ("Medicamento de Referência", "É um produto inovador, registrado no órgão federal responsável pela vigilância sanitária e comercializado no país; sua eficácia, segurança e qualidade foram comprovadas cientificamente pela ANVISA e são medicamentos com mais de 40 anos no mercado"),
        ("Medicamento Manipulado", "É o medicamento produzido em farmácias de manipulação ou hospitais com recursos para tal prática, seguindo prescrição médica de acordo com a necessidade individual de cada paciente."),
        ("Cosméticos", "Cosmético é aquilo que é relativo à beleza humana. Alguns produtos de higiene pessoal podem ser considerados cosméticos.");

# 4 - Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.

INSERT INTO tb_produtos(nome, valor, prescricao_medica, tipo, id_categoria)
	VALUES
		("Amoxicilina", 20.49, false, "Cápsula", 3),
        ("Dramin", 12.60, false, "Gota", 2),
        ("Loratadina", 21.30, false, "Cápsula", 2),
        ("Shampoo Elseve", 20.70, false, "", 5),
        ("Desodorante Dove", 16.50, false, "", 5),
        ("Cefadroxil", 55.99, true, "Cápsula", 3),
        ("Protetor solar", 69.50, false, "", 5),
        ("Miinoxidil", 120.99, false, "Gota", 4);
        
# 5 - Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.

SELECT * FROM tb_produtos
WHERE valor > 50;

# 6 - Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00.

SELECT * FROM tb_produtos
WHERE valor BETWEEN 5 AND 60;

# 7 - Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.

SELECT * FROM tb_produtos
WHERE nome LIKE "%c%";

# 8 - Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.

SELECT * FROM tb_produtos as p
INNER JOIN tb_categorias as c ON p.id_categoria = c.id;

# 9 - Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria cosméticos).

SELECT * FROM tb_produtos as p
INNER JOIN tb_categorias as c ON p.id_categoria = c.id
WHERE c.nome = "Cosméticos";