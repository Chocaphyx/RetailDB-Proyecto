-- Tablespace para datos:
-- Se usan como unidades lógicas de almacenamiento para organizar y almacenar los datos de la base de datos, 
-- permitiendo la administración de datos y la optimización del rendimiento. Sirven para separar diferentes tipos de objetos (tablas, índices, 
-- datos temporales, datos de deshacer) en archivos de datos físicos en el disco, lo que facilita la gestión del espacio, la asignación a diferentes dispositivos de almacenamiento y la mejora de la E/S. 
CREATE TABLESPACE techstore_datos
DATAFILE 'techstore_datos01.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED;

-- Tablespace para índices:
-- Se utilizan para almacenar físicamente los datos de los índices de forma separada, lo que mejora el rendimiento de las consultas y 
-- optimiza la gestión del almacenamiento al permitir distribuir los objetos de la base de datos en distintas ubicaciones físicas en disco. Al colocar los índices en sus propios tablespaces, 
-- se reduce la contención en las operaciones de entrada/salida (E/S) y se facilita la gestión de grandes volúmenes de datos al poder controlar el almacenamiento de forma individual. 
CREATE TABLESPACE techstore_indices
DATAFILE 'techstore_indices01.dbf'
SIZE 50M
AUTOEXTEND ON NEXT 5M MAXSIZE UNLIMITED;