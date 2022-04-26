/* ATIVIDADE 2

Crie um banco de dados para um serviço de uma Pizzaria. 
O nome do Banco de dados deverá ter o seguinte nome db_pizzaria_legal.
O sistema trabalhará com as informações dos produtos comercializados pela empresa.
O sistema trabalhará com 2 tabelas tb_pizzas e tb_categorias, que deverão estar relacionadas. */

CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

# 1 - Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar as pizzas.

CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255),
    PRIMARY KEY (id)
);

# 2 - Crie a tabela tb_pizzas e determine 4 atributos, além da Chave Primária, relevantes aos produtos da pizzaria.

CREATE TABLE tb_pizzas(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    doce BOOLEAN NOT NULL,
    tamanho VARCHAR(20) NOT NULL,
    id_categoria BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

# 3 - Insira 5 registros na tabela tb_categorias.

INSERT INTO tb_categorias(nome, descricao)
	VALUES
		("Napolitana", "É considerada o berço da pizza italiana e é onde estão os registros mais antigos dessa receita. Ela é, portanto, a forma mais tradicional, tendo a massa aberta no momento do preparo. É alta e macia, com bordas generosas."),
        ("Romana", "Bastante tradicional também, tem massa fina e crocante. Para uma melhor experiência, ela deve ser servida quente, recém-saída do forno."),
        ("Genovesa", "Mais grossa do que a de Napolitana, pode ter massa com até 4 cm de espessura."),
        ("Pan", "Tem uma massa bem consistente, porém aerada, lembrando um pão. Ela é montada numa panela assadeira, por isso o nome pan, que é panela em inglês."),
        ("Deep Dish", "Vai mudar seu conceito de massa grossa. Ela têm aparência próxima a de uma torta, com uma farta crosta de massa e várias camadas de queijo, molho e demais recheios.");
        
        
# 4 - Insira 8 registros na tabela tb_pizzas, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.

INSERT INTO tb_pizzas(nome, valor, doce, tamanho, id_categoria)
	VALUES
		("Brocolis com Queijo", 45.99, false, "Família", 1),
        ("5 Queijos", 47.99, false, "Família", 1),
        ("Anchovas", 60.50, false, "Família", 2),
        ("Nutella", 55.90, true, "Família", 4),
        ("Calabresa", 40.99, false, "Família", 1),
        ("Cebola", 55.99, false, "Broto", 3),
        ("Cogumelo Paris c/ Parmesão", 60.50, false, "Família", 5),
        ("Margherita", 45.99, false, "Broto", 1);
        
# 5 - Faça um SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00.

SELECT * FROM tb_pizzas
WHERE valor > 45;

# 6 - Faça um SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.

SELECT * FROM tb_pizzas
WHERE valor BETWEEN 50 AND 100;

# 7 - Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome.

SELECT * FROM tb_pizzas
WHERE nome LIKE "%m%";

# 8 - Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias.

SELECT * FROM tb_pizzas as p
INNER JOIN tb_categorias as c ON p.id_categoria = c.id;

# 9 - Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica (Exemplo: Todas as pizzas que são doce).

SELECT * FROM tb_pizzas as p
INNER JOIN tb_categorias as c ON p.id_categoria = c.id
WHERE c.nome = "Napolitana";