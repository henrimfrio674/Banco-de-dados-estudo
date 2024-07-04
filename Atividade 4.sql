
CREATE DATABASE db_cidade_das_carnes;


USE db_cidade_das_carnes;


CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);


CREATE TABLE tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255),
    valor DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);
INSERT INTO tb_categorias (nome, descricao) VALUES 
('Carnes Bovinas', 'Produtos de carne de boi.'),
('Carnes Suínas', 'Produtos de carne de porco.'),
('Carnes de Frango', 'Produtos de carne de frango.'),
('Carnes de Peixe', 'Produtos de carne de peixe.'),
('Carnes de Cordeiro', 'Produtos de carne de cordeiro.');

INSERT INTO tb_produtos (nome, descricao, valor, quantidade, categoria_id) VALUES 
('Picanha', 'Picanha bovina de alta qualidade.', 90.00, 50, 1),
('Costela', 'Costela bovina com osso.', 70.00, 30, 1),
('Lombo Suíno', 'Lombo de porco temperado.', 50.00, 20, 2),
('Linguiça de Porco', 'Linguiça suína caseira.', 30.00, 100, 2),
('Peito de Frango', 'Peito de frango sem osso e sem pele.', 20.00, 80, 3),
('Coxa de Frango', 'Coxa de frango com osso.', 15.00, 120, 3),
('Salmão', 'Filé de salmão fresco.', 120.00, 40, 4),
('Pernil de Cordeiro', 'Pernil de cordeiro temperado.', 150.00, 10, 5);

SELECT * FROM tb_produtos WHERE valor > 50.00;

SELECT * FROM tb_produtos WHERE valor BETWEEN 50.00 AND 150.00;


SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT tb_produtos.*, tb_categorias.nome AS categoria_nome, tb_categorias.descricao AS categoria_descricao
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id;

SELECT tb_produtos.*, tb_categorias.nome AS categoria_nome, tb_categorias.descricao AS categoria_descricao
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_categorias.nome = 'Carnes de Frango';
