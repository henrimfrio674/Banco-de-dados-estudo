
CREATE DATABASE db_pizzaria_legal;


USE db_pizzaria_legal;


CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);


CREATE TABLE tb_pizzas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255),
    valor DECIMAL(10, 2) NOT NULL,
    tamanho VARCHAR(20) NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);


INSERT INTO tb_categorias (nome, descricao) VALUES 
('Tradicional', 'Pizzas com sabores tradicionais.'),
('Especial', 'Pizzas com ingredientes especiais.'),
('Doce', 'Pizzas com sabores doces.'),
('Vegana', 'Pizzas sem ingredientes de origem animal.'),
('Personalizada', 'Pizzas com ingredientes personalizados a escolha do cliente.');


INSERT INTO tb_pizzas (nome, descricao, valor, tamanho, categoria_id) VALUES 
('Margherita', 'Molho de tomate, mussarela, manjericão.', 50.00, 'Grande', 1),
('Pepperoni', 'Molho de tomate, mussarela, pepperoni.', 55.00, 'Grande', 1),
('Frango com Catupiry', 'Molho de tomate, mussarela, frango desfiado, catupiry.', 60.00, 'Grande', 2),
('Chocolate', 'Chocolate derretido, granulado.', 40.00, 'Média', 3),
('Brigadeiro', 'Chocolate, granulado, leite condensado.', 45.00, 'Média', 3),
('Vegana de Legumes', 'Molho de tomate, legumes variados, sem queijo.', 65.00, 'Grande', 4),
('4 Queijos', 'Molho de tomate, mussarela, provolone, gorgonzola, parmesão.', 70.00, 'Grande', 2),
('Personalizada', 'Ingredientes a escolha do cliente.', 80.00, 'Grande', 5);


SELECT * FROM tb_pizzas WHERE valor > 45.00;


SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;


SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';


SELECT tb_pizzas.*, tb_categorias.nome AS categoria_nome, tb_categorias.descricao AS categoria_descricao
FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.categoria_id = tb_categorias.id;


SELECT tb_pizzas.*, tb_categorias.nome AS categoria_nome, tb_categorias.descricao AS categoria_descricao
FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.categoria_id = tb_categorias.id
WHERE tb_categorias.nome = 'Doce';
