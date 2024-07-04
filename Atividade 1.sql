
CREATE DATABASE db_generation_game_online;


USE db_generation_game_online;

CREATE TABLE tb_classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);
CREATE TABLE tb_personagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    ataque INT NOT NULL,
    defesa INT NOT NULL,
    nivel INT NOT NULL,
    classe_id INT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);


INSERT INTO tb_classes (nome, descricao) VALUES 
('Guerreiro', 'Especialista em combate corpo a corpo.'),
('Mago', 'Utiliza magia para atacar os inimigos.'),
('Arqueiro', 'Especialista em ataques à distância.'),
('Assassino', 'Hábil em ataques rápidos e furtivos.'),
('Paladino', 'Combina habilidades de combate e cura.');


INSERT INTO tb_personagens (nome, ataque, defesa, nivel, classe_id) VALUES 
('Aragorn', 2500, 1500, 20, 1),
('Gandalf', 3000, 1200, 30, 2),
('Legolas', 2000, 1300, 25, 3),
('Altair', 2200, 1100, 22, 4),
('Arthur', 1800, 2000, 15, 5),
('Conan', 2400, 1700, 28, 1),
('Merlin', 2800, 1400, 27, 2),
('Robin', 2100, 1600, 26, 3);


SELECT * FROM tb_personagens WHERE ataque > 2000;

SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;


SELECT * FROM tb_personagens WHERE nome LIKE '%C%';
SELECT tb_personagens.*, tb_classes.nome AS classe_nome, tb_classes.descricao
FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id;


SELECT tb_personagens.*, tb_classes.nome AS classe_nome, tb_classes.descricao
FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id
WHERE tb_classes.nome = 'Arqueiro';
