
CREATE DATABASE db_construindo_vidas;


USE db_construindo_vidas;


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
('Ferramentas', 'Ferramentas manuais e elétricas.'),
('Materiais de Construção', 'Cimento, tijolos, areia, etc.'),
('Tintas', 'Tintas para parede e acessórios.'),
('Hidráulica', 'Tubos, conexões e acessórios hidráulicos.'),
('Elétrica', 'Fios, cabos e equipamentos elétricos.');


INSERT INTO tb_produtos (nome, descricao, valor, quantidade, categoria_id) VALUES 
('Martelo', 'Martelo de aço com cabo de madeira.', 25.00, 50, 1),
('Furadeira', 'Furadeira elétrica de 500W.', 150.00, 20, 1),
('Cimento', 'Saco de cimento de 50kg.', 30.00, 100, 2),
('Tijolo', 'Tijolo cerâmico.', 1.50, 1000, 2),
('Tinta Branca', 'Lata de tinta branca 18L.', 120.00, 30, 3),
('Pincel', 'Pincel para pintura de 2 polegadas.', 10.00, 100, 3),
('Tubo PVC', 'Tubo de PVC 3 polegadas.', 20.00, 200, 4),
('Fio Elétrico', 'Rolo de fio elétrico 100m.', 70.00, 40, 5);


SELECT * FROM tb_produtos WHERE valor > 100.00;


SELECT * FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;


SELECT * FROM tb_produtos WHERE nome LIKE '%C%';


SELECT tb_produtos.*, tb_categorias.nome AS categoria_nome, tb_categorias.descricao AS categoria_descricao
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id;


SELECT tb_produtos.*, tb_categorias.nome AS categoria_nome, tb_categorias.descricao AS categoria_descricao
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_categorias.nome = 'Hidráulica';
