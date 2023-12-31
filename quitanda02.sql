-- Apagar Banco de Dados db_quitanda
DROP DATABASE db_quitanda;

-- Recriar o Banco de dados db_quitanda
CREATE DATABASE db_quitanda;

-- Selecionar o Banco de Dados db_quitanda
USE db_quitanda;

-- Criar a tabela tb_categorias
CREATE TABLE tb_categorias(
id bigint AUTO_INCREMENT,
descricao varchar(255) NOT NULL,
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_categorias
INSERT INTO tb_categorias (descricao)
VALUES ("Frutas");

INSERT INTO tb_categorias (descricao)
VALUES ("Verduras");

INSERT INTO tb_categorias (descricao)
VALUES ("Legumes");

INSERT INTO tb_categorias (descricao)
VALUES ("Temperos");


INSERT INTO tb_categorias (descricao)
VALUES ("Ovos");

INSERT INTO tb_categorias (descricao)
VALUES ("outros");

-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categorias;

-- Criar a Tabela tb_produtos
CREATE TABLE tb_produtos(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
quantidade int, 
dtvalidade date NULL,
preco decimal(6, 2),
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Insere dados na tabela tb_produtos
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Maçã", 1000, "2022-03-07", 1.99, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Banana", 1300, "2022-03-08", 5.00, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Laranja", 3000, "2022-03-13", 10.00, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Tomate", 1105, "2022-03-15", 3.00, 3);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);

INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Cinza", 1118, 0.50);

INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Verde", 1118, 0.50);

-- Visualiza todos os dados da tabela tb_produtos
SELECT * FROM tb_produtos;

-- Ordenando os registros em odem alfabetica
SELECT * FROM tb_produtos ORDER BY nome ASC;

-- inverso
SELECT * FROM tb_produtos ORDER BY nome DESC;

-- o nome como primeiro parametro, possui maior prioridade de ordanaçao 
SELECT * FROM tb_produtos ORDER BY nome, preco ASC;

-- operador in criterio especifico somente esses numeros
SELECT * FROM tb_produtos WHERE preco IN (5.00, 10.00, 15.00);

-- procurar entre um valor em especifico inicial e outro valor final DENTRO DO INTERVALO
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 15.00;

SELECT * FROM tb_produtos
WHERE preco IN (5.00, 10.00, 15.00)
OR quantidade IN(1000, 1500, 2000);

SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 15.00 ORDER BY preco ASC;

-- mostra aonde estiver o ra tanto no começo, meio ou final
SELECT * FROM tb_produtos WHERE nome LIKE "%ra%";

-- produtos que começam com ra
SELECT * FROM tb_produtos WHERE nome LIKE "ra%";

-- produtos que terminam com ra
SELECT * FROM tb_produtos WHERE nome LIKE "%ra";

 -- insert into tb_produtos(nome, preco, marca_id) values ("calca", 79.80, 99); da erro pois nao existe marca_id 99
 
 -- comandos de juncao (INNER join / RIGHT join / LEFT join)

-- duas juncoes em duas consultas
 SELECT * FROM tb_produtos;
 SELECT * FROM tb_categorias;
 
 -- uma consulta apenas com as duas tabelas
 
 -- relacionamento interligado produto e categoria interligados INNER JOIN
 SELECT nome, preco, quantidade, tb_categorias.descricao -- listar em uma outra coluna a descricao de categoria para o produto mas a descricao esta na tabela categoria

FROM tb_produtos 

INNER JOIN tb_categorias 

ON tb_produtos.categoriaid = tb_categorias.id; -- identifica os campos se existe um relacioanemento entre eles devem ter lago em comum no caso o id
 -- on fica como onde, procura
 
SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id; -- comparacao se tem uma relacao entre essas tabelas e seus ids
 
 -- LEFT JOIN a tabela esquerda sempre sera a dependente a estrangeira
 -- traz tds produtos ou seja td a tabela produto por estar a esquerda
 -- traz tds itens da tabela produto dependente mesmo q nao tenha relacionamento
 -- td q esta atras da palavra left vai ser mostrado
SELECT nome, preco, quantidade, tb_categorias.descricao

FROM tb_produtos LEFT JOIN tb_categorias 

ON tb_produtos.categoria_id = tb_categorias.id;

-- RIGHT JOIN 
-- mesmo q uma categoria n esteja atribuida a um roduto
-- a direita 

SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos RIGHT JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id;

-- As vezes precisamos pesquisar dados e agrupar estas informações por algum critério, como por exemplo encontra a média de preço dos produtos, agrupados por categoria, ou seja, a média do preço por categoria. Para criarmos esta consulta, utilizaremos a clausula GROUP BY, onde indicaremos por qual atributo queremos agrupar os dados.
-- SELECT com GROUP BY

SELECT tb_categorias.descricao, AVG(Preco) as 'Preço Médio'
FROM tb_produtos 
INNER JOIN tb_categorias ON tb_categorias.Id = tb_produtos.categoria_id 
GROUP BY tb_categorias.descricao;
