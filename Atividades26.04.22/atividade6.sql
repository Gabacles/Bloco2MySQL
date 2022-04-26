/* ATIVIDADE 6

Crie um banco de dados para uma plataforma de Cursos Online (EAD). 
O nome do Banco de dados deverá ter o seguinte nome db_curso_da_minha_vida. 
O sistema trabalhará com as informações dos produtos comercializados pela empresa. 
O sistema trabalhará com 2 tabelas tb_cursos e tb_categorias, que deverão estar relacionadas.
 */

CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

# 1 - Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os produtos.

CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    ativo INT NOT NULL,
    PRIMARY KEY (id)
);

# 2 - Crie a tabela tb_cursos e determine 4 atributos, além da Chave Primária, relevantes aos cursos.

CREATE TABLE tb_cursos(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    horas INT NOT NULL,
    vagas INT,
    id_categoria BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

# 3 - Insira 5 registros na tabela tb_categorias.

INSERT INTO tb_categorias(nome, ativo)
	VALUES
		("Java", true),
        ("Python", true),
        ("C++", true),
        ("Javascript", true),
        ("MySQL", true);

# 4 - Insira 8 registros na tabela tb_cursos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.

INSERT INTO tb_cursos(nome, valor, horas, vagas, id_categoria)
	VALUES
		("Java Xpert Full Stack", 1200, 136, 300, 1),
        ("Mastering C++ Code Everything", 900, 136, 200, 3),
        ("Python AI", 499, 80, 150, 2),
        ("Back-end Com Spring Boot", 620, 200, 250, 1),
        ("Front-end Avançado", 730, 300, 100, 4),
        ("Fundamentos de Banco de Dados com MySQL", 250, 100, 300, 5),
        ("Python & Django", 899, 230, 120, 2),
        ("React", 600, 140, 80, 4);
        
# 5 - Faça um SELECT que retorne todes os cursos cujo valor seja maior do que R$ 500,00.

SELECT * FROM tb_cursos
WHERE valor > 500;

# 6 - Faça um SELECT que retorne todes os cursos cujo valor esteja no intervalo R$ 600,00 e R$ 1000,00.

SELECT * FROM tb_cursos
WHERE valor BETWEEN 600 AND 1000;

# 7 - Faça um SELECT utilizando o operador LIKE, buscando todes os cursos que possuam a letra J no atributo nome.

SELECT * FROM tb_cursos
WHERE nome LIKE "%j%";

# 8 - Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias.

SELECT * FROM tb_cursos as p
INNER JOIN tb_categorias as c ON p.id_categoria = c.id;

# 9 - Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os cursos que pertencem a categoria Java).

SELECT * FROM tb_cursos as p
INNER JOIN tb_categorias as c ON p.id_categoria = c.id
WHERE c.nome = "Python";