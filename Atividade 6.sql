CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);

CREATE TABLE tb_cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255),
    valor DECIMAL(10, 2) NOT NULL,
    duracao INT NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) VALUES 
('Programação', 'Cursos relacionados a desenvolvimento de software.'),
('Design', 'Cursos de design gráfico e UX/UI.'),
('Marketing', 'Cursos de marketing digital e tradicional.'),
('Negócios', 'Cursos de administração e empreendedorismo.'),
('Fotografia', 'Cursos de técnicas de fotografia e edição.');

INSERT INTO tb_cursos (nome, descricao, valor, duracao, categoria_id) VALUES 
('Curso de Java', 'Curso completo de programação em Java.', 700.00, 40, 1),
('Curso de Python', 'Curso de introdução ao Python.', 500.00, 30, 1),
('Curso de UX Design', 'Curso de fundamentos de UX Design.', 600.00, 35, 2),
('Curso de Photoshop', 'Curso de edição de imagens com Photoshop.', 400.00, 25, 2),
('Curso de SEO', 'Curso de otimização para motores de busca.', 750.00, 20, 3),
('Curso de Marketing de Conteúdo', 'Curso de criação de conteúdo para marketing.', 550.00, 30, 3),
('Curso de Gestão de Projetos', 'Curso de técnicas de gestão de projetos.', 950.00, 45, 4),
('Curso de Fotografia Digital', 'Curso de introdução à fotografia digital.', 300.00, 15, 5);

SELECT * FROM tb_cursos WHERE valor > 500.00;

SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_cursos WHERE nome LIKE '%J%';

SELECT tb_cursos.*, tb_categorias.nome AS categoria_nome, tb_categorias.descricao AS categoria_descricao
FROM tb_cursos
INNER JOIN tb_categorias ON tb_cursos.categoria_id = tb_categorias.id;

SELECT tb_cursos.*, tb_categorias.nome AS categoria_nome, tb_categorias.descricao AS categoria_descricao
FROM tb_cursos
INNER JOIN tb_categorias ON tb_cursos.categoria_id = tb_categorias.id
WHERE tb_categorias.nome = 'Programação';
