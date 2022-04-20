# ATIVIDADE 01

# 1 - Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema trabalhará com as informações dos colaboradores desta empresa. 

CREATE DATABASE db_recursos_humanos;
USE db_recursos_humanos;

# 2 - Crie uma tabela de colaboradores e determine 5 atributos relevantes dos colaboradores para se trabalhar com o serviço deste RH.

CREATE TABLE tb_colaboradores(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255),
    cargo VARCHAR(255),
    telefone VARCHAR(20),
    salario DECIMAL,
    data_de_nascimento DATE,
    
    PRIMARY KEY (id)
);

SELECT * FROM tb_colaboradores;

# 3 - Insira nesta tabela no mínimo 5 dados (registros).

INSERT INTO tb_colaboradores(nome, cargo, telefone, salario, data_de_nascimento)
VALUES("Felipe Azevedo", "Gerente", "(11) 3651-7732", 6000, '1989-04-21');

INSERT INTO tb_colaboradores(nome, cargo, telefone, salario, data_de_nascimento)
VALUES("Maria Oliveira", "Gerente", "(11) 3526-7752", 6000, '1991-05-06');

INSERT INTO tb_colaboradores(nome, cargo, telefone, salario, data_de_nascimento)
VALUES("Carlos Sousa", "Assistente", "(11) 3265-7753", 1850, '1996-12-02');

INSERT INTO tb_colaboradores(nome, cargo, telefone, salario, data_de_nascimento)
VALUES("Kaique Castro", "Assistente", "(11) 3541-8856", 1850, '1985-04-16');

INSERT INTO tb_colaboradores(nome, cargo, telefone, salario, data_de_nascimento)
VALUES("Maira Gatti", "Assistente", "(11) 3661-9849", 1850, '1989-01-15');

# 4 - Faça um SELECT que retorne todes os colaboradores com o salário maior do que 2000.

SELECT * FROM tb_colaboradores WHERE salario > 2000;

# 5 - Faça um SELECT que retorne todes os colaboradores com o salário menor do que 2000.

SELECT * FROM tb_colaboradores WHERE salario < 2000;

# 6 - Ao término atualize um registro desta tabela através de uma query de atualização.

UPDATE tb_colaboradores SET cargo = "Analista", salario = 3200
WHERE id = 5;

# --------------------------------------------------------------------------------------------------------------------------------------------------

# ATIVIDADE 02

# Crie um banco de dados para um e-commerce, onde o sistema trabalhará com as informações dos produtos deste e-commerce. 

CREATE DATABASE db_ecommerce;
USE db_ecommerce;

# 2 - Crie uma tabela de produtos e determine 5 atributos relevantes dos produtos para se trabalhar com o serviço deste e-commerce.

CREATE TABLE tb_produtos(
	id BIGINT AUTO_INCREMENT,
    marca VARCHAR(255),
    nome VARCHAR(255),
    preco DECIMAL,
    quantidade INT,
    
    PRIMARY KEY(id)
);

# 3 - Insira nesta tabela no mínimo 8 dados (registros).

INSERT INTO tb_produtos(marca, nome, preco, quantidade)
VALUES("Gillette", "Espuma de Barbear", 32, 200);

INSERT INTO tb_produtos(marca, nome, preco, quantidade)
VALUES("Gillette", "Barbeador", 20, 500);

INSERT INTO tb_produtos(marca, nome, preco, quantidade)
VALUES("Sony", "Playstation 5", 4699, 50);

INSERT INTO tb_produtos(marca, nome, preco, quantidade)
VALUES("Sony", "SmarTV 48", 3200, 100);

INSERT INTO tb_produtos(marca, nome, preco, quantidade)
VALUES("Sony", "Smartphone", 1899, 200);

INSERT INTO tb_produtos(marca, nome, preco, quantidade)
VALUES("Samsung", "SmarTV 32", 2399, 300);

INSERT INTO tb_produtos(marca, nome, preco, quantidade)
VALUES("Samsung", "Samsung Galaxy S21", 3999, 80);

INSERT INTO tb_produtos(marca, nome, preco, quantidade)
VALUES("Pampers", "Fraldas Confort Sec G", 260, 186);

# 4 - Faça um SELECT que retorne todes os produtos com o valor maior do que 500.

SELECT * FROM tb_produtos WHERE preco > 500;

# 5 - Faça um SELECT que retorne todes os produtos com o valor menor do que 500.

SELECT * FROM tb_produtos WHERE preco < 500;

# 6 - Ao término atualize um registro desta tabela através de uma query de atualização.

UPDATE tb_produtos SET preco = 3499
WHERE id = 7;

# --------------------------------------------------------------------------------------------------------------------------------------------------

# Atividade 3

# 1 - Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará com as informações dos estudantes deste registro dessa escola. 

CREATE DATABASE db_escola;
USE db_escola;

# 2 - Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 atributos relevantes dos estudantes para se trabalhar com o serviço dessa escola.

CREATE TABLE tb_estudantes(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    rg VARCHAR(12) NOT NULL,
    cpf VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    nota DECIMAL(2,1),
    PRIMARY KEY(id)
);

# 3 - Insira nesta tabela no mínimo 8 dados (registros)

INSERT INTO tb_estudantes(nome, rg, cpf, email, nota)
VALUES
	("Ian Hanson","UMB67NOV7SZ","6546546545","pharetra.nibh@protonmail.com", 8.7),
	("Lars Carney","VFM57CWV3VH","8798787987","mauris.elit@aol.com", 7.8),
	("Amaya Mcfarland","DPE08JCN8OS","5465654654","lorem.vitae.odio@protonmail.org", 6.5),
	("Guinevere Velez","OTO81BHJ6VD","3216542154","malesuada.fames@yahoo.com", 9.8),
	("Jolie Ferrell","DBP58VYL5FG","87954984984","lectus.ante@outlook.net", 7.3),
    ("Tiger Randall","ZKR22BFY7EQ","5854687685","in.tempus.eu@google.couk", 8.0),
	("Akeem Freeman","MWA53SMT9TR","3367254657","sagittis.duis.gravida@icloud.org", 6.5),
	("Todd Pearson","CNM92YDO2IH","6361565465","lacinia@aol.edu", 5.2),
	("Duncan Harding","FDC35IUA9WV","5351054654","laoreet.libero@yahoo.net", 8.5),
	("Keaton Bullock","VZO39SGE6PN","28649687878","et.magnis@google.ca", 4.5);

SELECT * FROM tb_estudantes;
    
# 4 - Faça um SELECT que retorne todes o/a(s) estudantes com a nota maior do que 7.0.

SELECT * FROM tb_estudantes
WHERE nota > 7;

# 5 - Faça um SELECT que retorne todes o/a(s) estudantes com a nota menor do que 7.0.

SELECT * FROM tb_estudantes
WHERE nota < 7;

# 6 - Ao término atualize um registro desta tabela através de uma query de atualização.

UPDATE tb_estudantes SET nota = 8.0
WHERE id = 7;