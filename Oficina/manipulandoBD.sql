show tables;

# Mostrar dados de todas as tabelas
select * from car;
select * from carpart;
select * from carpart_so;
select * from carpart_storage;
select * from carpart_supplier;
select * from clients;
select * from mechanic;
select * from serviceorder;
select * from storages;
select * from supplier;

# Modificação de campo por ID
UPDATE CARPART SET TYPECARPART = 'Serviço' WHERE IDCARPART IN (3, 4, 7, 9);
SELECT * FROM carpart;

# Quantas ordem de serviço tem peça
SELECT COUNT(*) AS N_SERVICO_C_PECA
FROM 
(SELECT A.IDCPSOSO
FROM CARPART_SO A
INNER JOIN CARPART B ON A.IDCPSOCARPART = B.IDCARPART
WHERE B.TYPECARPART = 'Peça'
GROUP BY A.IDCPSOSO) A;

# Quantos serviços já foram feitos?
SELECT COUNT(*) N_SERVICO_FEITO
FROM SERVICEORDER;

# Quantos serviços por categoria de status
SELECT STATUSSO, COUNT(*) AS N_SERVICO
FROM SERVICEORDER
GROUP BY STATUSSO;

# Qual era o produto/serviço do status cancelado
SELECT C.CNAME AS NOME_PRODUTO_SERVICO
FROM SERVICEORDER A
INNER JOIN CARPART_SO B ON A.IDSERVICEORDER = B.IDCARPARTSO
INNER JOIN CARPART C ON B.IDCPSOCARPART = C.IDCARPART
WHERE A.STATUSSO = 'Cancelado';

# Listar os clientes em ordem alfabetica
SELECT CONCAT(CNAME, ' ', MNAME, ' ', LNAME) AS NOME_COMPLETO_CLIENTE
FROM CLIENTS
ORDER BY CNAME;

