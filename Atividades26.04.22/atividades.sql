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


# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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


# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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


# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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


# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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


# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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