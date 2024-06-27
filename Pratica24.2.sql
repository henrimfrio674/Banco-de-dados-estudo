CREATE TABLE colaboradores (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    departamento VARCHAR(50),
    salario DECIMAL(10, 2),
    data_admissao DATE
);

INSERT INTO colaboradores (id, nome, cargo, departamento, salario, data_admissao) VALUES
(1, 'Ana Silva', 'Analista', 'Financeiro', 2500.00, '2021-03-15'),
(2, 'Carlos Souza', 'Desenvolvedor', 'TI', 1800.00, '2020-06-01'),
(3, 'Mariana Lima', 'Gerente', 'RH', 3000.00, '2019-11-23'),
(4, 'Pedro Santos', 'Assistente', 'Marketing', 1500.00, '2022-01-10'),
(5, 'Fernanda Costa', 'Coordenadora', 'Operações', 2200.00, '2021-09-30');

SELECT * FROM colaboradores WHERE salario > 2000;

SELECT * FROM colaboradores WHERE salario < 2000;

UPDATE colaboradores
SET salario = 2600.00
WHERE id = 1;
