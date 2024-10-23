SELECT 
    e.nome AS Nome_Empregado,
    e.cpf AS CPF_Empregado,
    e.data_admissao AS Data_Admissao,
    e.salario AS Salario,
    d.nome AS Departamento,
    t.numero_telefone AS Numero_Telefone
FROM 
    empregados e
JOIN 
    departamentos d ON e.departamento_id = d.id
JOIN 
    telefones t ON e.id = t.empregado_id
WHERE 
    e.data_admissao BETWEEN '2019-01-01' AND '2022-03-31'
ORDER BY 
    e.data_admissao DESC;

SELECT 
    e.nome AS Nome_Empregado,
    e.cpf AS CPF_Empregado,
    e.data_admissao AS Data_Admissao,
    e.salario AS Salario,
    d.nome AS Departamento,
    t.numero_telefone AS Numero_Telefone
FROM 
    empregados e
JOIN 
    departamentos d ON e.departamento_id = d.id
JOIN 
    telefones t ON e.id = t.empregado_id
WHERE 
    e.salario < (SELECT AVG(salario) FROM empregados)
ORDER BY 
    e.nome;

SELECT 
    d.nome AS Departamento,
    COUNT(e.id) AS Quantidade_de_Empregados,
    AVG(e.salario) AS Media_Salarial,
    AVG(e.comissao) AS Media_da_Comissao
FROM 
    departamentos d
JOIN 
    empregados e ON d.id = e.departamento_id
GROUP BY 
    d.nome
ORDER BY 
    d.nome;

SELECT 
    e.nome AS Nome_Empregado,
    e.cpf AS CPF_Empregado,
    e.sexo AS Sexo,
    e.salario AS Salario,
    COUNT(v.id) AS Quantidade_Vendas,
    SUM(v.valor) AS Total_Valor_Vendido,
    SUM(v.comissao) AS Total_Comissao_das_Vendas
FROM 
    empregados e
JOIN 
    vendas v ON e.id = v.empregado_id
GROUP BY 
    e.nome, e.cpf, e.sexo, e.salario
ORDER BY 
    Quantidade_Vendas DESC;

SELECT 
    e.nome AS Nome_Empregado,
    e.cpf AS CPF_Empregado,
    e.sexo AS Sexo,
    e.salario AS Salario,
    COUNT(v.id) AS Quantidade_Vendas_com_Serviço,
    SUM(v.valor_servico) AS Total_Valor_Vendido_com_Serviço,
    SUM(v.comissao) AS Total_Comissao_das_Vendas_com_Serviço
FROM 
    empregados e
JOIN 
    vendas v ON e.id = v.empregado_id
WHERE 
    v.tipo = 'serviço'
GROUP BY 
    e.nome, e.cpf, e.sexo, e.salario
ORDER BY 
    Quantidade_Vendas_com_Serviço DESC;

SELECT 
    p.nome AS Nome_do_Pet,
    s.data_servico AS Data_do_Serviço,
    s.nome_servico AS Nome_do_Serviço,
    s.quantidade AS Quantidade,
    s.valor AS Valor,
    e.nome AS Empregado_que_realizou_o_Serviço
FROM 
    pets p
JOIN 
    servicos s ON p.id = s.pet_id
JOIN 
    empregados e ON s.empregado_id = e.id
ORDER BY 
    s.data_servico DESC;

SELECT 
    v.data_venda AS Data_da_Venda,
    v.valor AS Valor,
    v.desconto AS Desconto,
    (v.valor - v.desconto) AS Valor_Final,
    e.nome AS Empregado_que_realizou_a_venda
FROM 
    vendas v
JOIN 
    empregados e ON v.empregado_id = e.id
WHERE 
    v.cliente_id = ?  -- Substitua o "?" pelo ID do cliente específico
ORDER BY 
    v.data_venda DESC;

SELECT 
    s.nome_servico AS Nome_do_Serviço,
    COUNT(v.id) AS Quantidade_Vendas,
    SUM(v.valor_servico) AS Total_Valor_Vendido
FROM 
    servicos s
JOIN 
    vendas v ON s.id = v.servico_id
GROUP BY 
    s.nome_servico
ORDER BY 
    Quantidade_Vendas DESC
LIMIT 10;

SELECT 
    fp.tipo AS Tipo_Forma_Pagamento,
    COUNT(v.id) AS Quantidade_Vendas,
    SUM(v.valor) AS Total_Valor_Vendido
FROM 
    formas_pagamento fp
JOIN 
    vendas v ON fp.id = v.forma_pagamento_id
GROUP BY 
    fp.tipo
ORDER BY 
    Quantidade_Vendas DESC;

SELECT 
    v.data_venda AS Data_Venda,
    COUNT(v.id) AS Quantidade_de_Vendas,
    SUM(v.valor) AS Valor_Total_Venda
FROM 
    vendas v
GROUP BY 
    v.data_venda
ORDER BY 
    v.data_venda DESC;

SELECT 
    p.nome AS Nome_Produto,
    p.valor AS Valor_Produto,
    c.nome AS Categoria_do_Produto,
    f.nome AS Nome_Fornecedor,
    f.email AS Email_Fornecedor,
    f.telefone AS Telefone_Fornecedor
FROM 
    produtos p
JOIN 
    categorias c ON p.categoria_id = c.id
JOIN 
    fornecedores f ON p.fornecedor_id = f.id
ORDER BY 
    p.nome;

SELECT 
    p.nome AS Nome_Produto,
    COUNT(v.id) AS Quantidade_Total_Vendas,
    SUM(v.valor) AS Valor_Total_Recebido_pela_Venda_do_Produto
FROM 
    produtos p
JOIN 
    vendas v ON p.id = v.produto_id
GROUP BY 
    p.nome
ORDER BY 
    Quantidade_Total_Vendas DESC;

