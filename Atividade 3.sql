
CREATE DATABASE db_farmacia_bem_estar;


USE db_farmacia_bem_estar;


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
('Medicamentos', 'Produtos farmacêuticos para tratamento de doenças.'),
('Cosméticos', 'Produtos de beleza e cuidados pessoais.'),
('Suplementos', 'Produtos para suplementação alimentar.'),
('Higiene', 'Produtos para higiene pessoal.'),
('Equipamentos', 'Produtos e equipamentos médicos.');


INSERT INTO tb_produtos (nome, descricao, valor, quantidade, categoria_id) VALUES 
('Paracetamol', 'Analgésico e antitérmico.', 10.00, 100, 1),
('Shampoo Anticaspa', 'Shampoo para tratamento de caspa.', 25.00, 50, 2),
('Vitamina C', 'Suplemento de vitamina C.', 30.00, 200, 3),
('Sabonete Líquido', 'Sabonete líquido para higiene pessoal.', 15.00, 150, 4),
('Termômetro Digital', 'Termômetro para medição de temperatura corporal.', 75.00, 30, 5),
('Ibuprofeno', 'Analgésico e anti-inflamatório.', 20.00, 120, 1),
('Creme Hidratante', 'Hidratante para pele seca.', 45.00, 80, 2),
('Glicopan Pet', 'Suplemento vitamínico para animais.', 55.00, 60, 3);


SELECT * FROM tb_produtos WHERE valor > 50.00;


SELECT * FROM tb_produtos WHERE valor BETWEEN 5.00 AND 60.00;


SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT tb_produtos.*, tb_categorias.nome AS categoria_nome, tb_categorias.descricao AS categoria_descricao
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id;

SELECT tb_produtos.*, tb_categorias.nome AS categoria_nome, tb_categorias.descricao AS categoria_descricao
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_categorias.nome = 'Cosméticos';
