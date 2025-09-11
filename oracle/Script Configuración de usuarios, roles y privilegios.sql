ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
-- Crear usuario el kenji:
CREATE USER kenji IDENTIFIED BY 123;

-- Damos rol de usuario para conectarse al sistema:
GRANT CONNECT TO kenji ;

-- Damos privilegios para el que el usuario kenji pueda hacer los metodos CRUD en la tabla productos:
GRANT SELECT, INSERT, UPDATE, DELETE ON productos TO kenji;

ALTER USER kenji QUOTA UNLIMITED ON users;
