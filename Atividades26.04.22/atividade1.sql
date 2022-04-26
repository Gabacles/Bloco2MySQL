/* ATIVIDADE 01

Crie um banco de dados para um serviço de um Games Online. O nome do Banco de dados deverá ter o seguinte nome db_generation_game_online. 
O sistema trabalhará com as informações dos personagens do jogo. O sistema trabalhará com 2 tabelas tb_personagens e tb_classes, que deverão estar relacionadas. */

CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

# 1 - Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os personagens do Game Online. 

CREATE TABLE tb_classes(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255),
    PRIMARY KEY (id)
);

# 2 - Crie a tabela tb_personagens e determine 4 atributos, além da Chave Primária, relevantes aos personagens do Game Online.

CREATE TABLE tb_personagens(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    ataque INT NOT NULL,
    defesa INT NOT NULL,
    sabedoria INT NOT NULL,
    id_classes BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_classes) REFERENCES tb_classes(id)
);

# 3 - Insira 5 registros na tabela tb_classes.

INSERT INTO tb_classes(nome, descricao)
	VALUES
		("Mago", "Tem capacidade de lançar certos tipos de magia, mas sendo fraco em combate corpo a corpo; subclasses são distinguidas por pontos fortes em algumas áreas de magia e fraqueza em outras."),
        ("Cavaleiro", "cavaleiros são bem resistentes possuindo na maioria das vezes armaduras pesadas e também armas longas e com mais poder destrutivo. (espadas longas, marretas de guerra e etc)"),
        ("Arqueiro", "Combate a distância com arco e flecha (às vezes com vários tipos de flechas como fogo, gelo, prata, etc)"),
        ("Ladino", "Combate corporal com adagas, katares, punhais e outras armas de punho. Costumam destruir seus oponentes em poucos segundos, mas podem sofrer contra classes resistentes ou capazes de causar atordoamentos, paralisias, etc."),
        ("Bardo", "Habilidades de suporte utilitário como buffs e debuffs em área");
        
# 4 - Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_classes.

INSERT INTO tb_personagens(nome, ataque, defesa, sabedoria, id_classes)
	VALUES
		("Muambeiro", "2300", "1800", "500", 2),
        ("Hurley-qix", "2220", "1830", "470", 2),
        ("Sumunadorr", "2120", "1000", "900", 1),
        ("Live-lol", "1200", "980", "830", 5),
        ("Priamo", "2250", "900", "720", 3),
        ("Arnador", "2300", "830", "692", 3),
        ("Sacita", "2560", "600", "430", 4),
        ("Mosnir", "2480", "620", "450", 4);
        
# 5 - Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.

SELECT * FROM tb_personagens
WHERE ataque > 2000;

# 6 - Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.

SELECT * FROM tb_personagens
WHERE defesa BETWEEN 1000 AND 2000;

# 7 - Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.

SELECT * FROM tb_personagens
WHERE nome LIKE "%c%";

# 8 - Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.

SELECT * FROM tb_personagens 
INNER JOIN tb_classes ON tb_personagens.id_classes = tb_classes.id;

# 9 - Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros).

SELECT * FROM tb_personagens AS p
INNER JOIN tb_classes AS c ON p.id_classes = c.id
WHERE c.nome = "Ladino";
