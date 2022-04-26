/* ATIVIDADE 5

Crie um banco de dados para um serviço de uma loja de Material de Construção. 
O nome do Banco de dados deverá ter o seguinte nome db_construindo_vidas. 
O sistema trabalhará com as informações dos produtos comercializados pela empresa. 
O sistema trabalhará com 2 tabelas tb_produtos e tb_categorias, que deverão estar relacionadas. */

CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

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
    estoque INT,
    id_categoria BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

# 3 - Insira 5 registros na tabela tb_categorias.

INSERT INTO tb_categorias(nome, descricao)
	VALUES
		("Argamassa", "A argamassa é uma massa homogênea com propriedades de aderência e endurecimento. Ela pode ser preparada na obra ou industrializada"),
        ("Aço", "O aço é uma liga metálica composta principalmente de ferro e carbono. Com apenas 2% de carbono em sua composição, o aço oferece boa resistência mecânica a baixo custo."),
        ("Hidráulica", "É responsável pelo conhecimento das leis que regem o transporte, a conversão de energia, a regulação e o controle do fluido agindo sobre suas variáveis."),
        ("Aditivos", "Os aditivos são substâncias adicionadas as argamassas ou concretos com finalidade de modificar as propriedades da massa fresca ou do produto final."),
        ("Cal", "É utilizada na fabricação de argamassas de assentamento e revestimento, pinturas, misturas asfálticas, estabilização de solos, produção de isolantes térmicos, fabricação de blocos sílicos-calcários, entre outras aplicações.");

# 4 - Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.

INSERT INTO tb_produtos(nome, valor, ativo, estoque, id_categoria)
	VALUES
		("Argamassa Cimentcola Interno", 55.60, true, 500, 1),
        ("Aço CA-50", 200.50, true, 100, 2),
        ("Aço CA-60", 260.50, true, 80, 2),
        ("Cano PVC", 45.60, true, 500, 3),
        ("Aditivo Plastificante Vedalit 18L", 130, true, 50, 4),
        ("Aditivo Concreto Arganol 3,6 Litros", 43.50, true, 100, 4),
        ("Cal Hidratada para Construção Civil 20Kg Votoran", 25.49, true, 50, 5),
        ("Cano PVC tipo T", 39, true, 250, 3);
        
# 5 - Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 100,00.

SELECT * FROM tb_produtos
WHERE valor > 100;

# 6 - Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 70,00 e R$ 150,00.

SELECT * FROM tb_produtos
WHERE valor BETWEEN 70 AND 150;

# 7 - Faça um SELECT utilizando o operador LIKE, buscando todas as carnes que possuam a letra C no atributo nome.

SELECT * FROM tb_produtos
WHERE nome LIKE "%c%";

# 8 - Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.

SELECT * FROM tb_produtos as p
INNER JOIN tb_categorias as c ON p.id_categoria = c.id;

# 9 - Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria hidráulica).

SELECT * FROM tb_produtos as p
INNER JOIN tb_categorias as c ON p.id_categoria = c.id
WHERE c.nome = "Aço";